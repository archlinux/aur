# Maintainer: redfish <redfish at galactica dot pw>

pkgname='zeronet'
pkgver=0.6.2
pkgrel=3
arch=('any')
url="https://zeronet.io/"
depends=('python2'
         'python2-gevent'
         'python2-msgpack')
optdepends=('tor: anonymity')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
source=("https://github.com/HelloZeroNet/ZeroNet/archive/v$pkgver.tar.gz"
        "zeronet.conf"
        "zeronet.service")
sha256sums=('d07aa18ca81ca30be9a118dfb845bbaeca6551b13672e6d87851f3544f9d7f2f'
            'ea735e82dbb10a2c1fda7abfeb2f38c2429044d8254f9e2396c50cecb6f778f8'
            '46fcbaddf5346ba384539efd6873c26bef4e767e328c6543f9fd511022aea9e7')
install="zeronet.install"
backup=("etc/zeronet.conf")
options=(!strip) # ignore test binaries in the depsendency libs that fail strip

# Upstream uses camel case
_pkgarchive="ZeroNet-$pkgver"

package() {
   mkdir -p "$pkgdir/opt/zeronet"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_pkgarchive/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   install -D -m644 "$srcdir/$_pkgarchive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgarchive/LICENSE"
}
