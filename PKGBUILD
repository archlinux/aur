pkgname=binfmt-support
pkgver=2.1.6
pkgrel=1
pkgdesc="register interpreters for various binary formats"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('libpipeline')
makedepends=()
source=(http://ftp.de.debian.org/debian/pool/main/b/binfmt-support/binfmt-support_$pkgver.orig.tar.gz
	binfmt-support.service)
md5sums=('b3389857d88f35c93b45f99a19a24698'
         '72df6ac607ebfe9eface932b76b66291')

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
