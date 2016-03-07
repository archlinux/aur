# Maintainer: redfish <redfish at galactica dot pw>

pkgname='zeronet'
pkgver=0.3.5
pkgrel=1
arch=('any')
url="https://zeronet.io/"
depends=('python2>=2.7.10'
         'python2-gevent'
         'python2-msgpack'
		)
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
source=("https://github.com/HelloZeroNet/ZeroNet/archive/v$pkgver.tar.gz"
        "zeronet.conf"
        "zeronet.service")
md5sums=('879a0882fcbd3618020a78a56bb6597f'
         '1c2281156533c912e407cf64f6a57e96'
	 '5ff9b2c9b8f913bf4fd29b61e61e2334')
install="zeronet.install"
backup=("etc/zeronet.conf")

# Upstream uses camel case
_pkgarchive="ZeroNet-$pkgver"

package() {
   cd "$srcdir/$_gitname"

   mkdir -p "$pkgdir/opt/zeronet"

   # zeronet.py expects log directory to exist
   mkdir -p "$pkgdir/opt/zeronet/log"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_pkgarchive/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   install -D -m644 "$srcdir/$_pkgarchive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgarchive/LICENSE"
}
