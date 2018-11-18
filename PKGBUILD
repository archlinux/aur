# Maintainer: redfish <redfish at galactica dot pw>

pkgname='zeronet'
pkgver=0.6.3
pkgrel=1
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

sha256sums=('030795e0c8bddd4c9ce01ab22765e8a0068349e0bc711f07062fc1516bcacf8a'
            'ea735e82dbb10a2c1fda7abfeb2f38c2429044d8254f9e2396c50cecb6f778f8'
            '46fcbaddf5346ba384539efd6873c26bef4e767e328c6543f9fd511022aea9e7')
