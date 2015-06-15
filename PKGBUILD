# Maintaner: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Gordon JC Pearce <gordon@gjcp.net>
pkgname=node
pkgver=0.3.2
pkgrel=2
pkgdesc="AX25 node software"
arch=(i686 x86_64)
url="http://tldp.org/HOWTO/AX25-HOWTO/x1688.html"
license=('GPL')
optdepends=('ax25-tools: hamradio modem support'
            'soundmodem: software packet radio modem')
source=(
  http://ftp.de.debian.org/debian/pool/main/n/node/node_0.3.2.orig.tar.gz
  node.patch
)
md5sums=('e458f3d8d75fd364f7841a296e0a4eae'
         'a05aeae5c98fa47e30de494809c00a3b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < $srcdir/node.patch
  ./configure
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
