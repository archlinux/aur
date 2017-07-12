pkgname=binfmt-support
pkgver=2.1.7
pkgrel=1
pkgdesc="register interpreters for various binary formats"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('libpipeline')
makedepends=()
source=(http://ftp.de.debian.org/debian/pool/main/b/binfmt-support/binfmt-support_$pkgver.orig.tar.gz
	binfmt-support.service)
sha256sums=('7ca0d0009220b9213e4637f4bbdc3c0030b0548eb9bbcd56e0a99876fa879a55'
            'efba2300b9f0c8c5c14696d2b25836d91edaaad8d30c64ed7d3eab0163b2553e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sbindir=/usr/bin --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -dm0755 $pkgdir/var/lib/binfmts
  install -Dm755 $srcdir/binfmt-support.service $pkgdir/usr/lib/systemd/system/binfmt-support.service
}
