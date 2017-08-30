pkgname=binfmt-support
pkgver=2.1.8
pkgrel=1
pkgdesc="register interpreters for various binary formats"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('libpipeline')
makedepends=()
source=(ftp://ftp.de.debian.org/debian/pool/main/b/binfmt-support/binfmt-support_$pkgver.orig.tar.gz
	binfmt-support.service)
sha256sums=('ebad04db8444d2275d042b5074fa3e160bcf3e2c23ee9b660e75f5acd73618a2'
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
