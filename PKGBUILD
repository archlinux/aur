pkgname=binfmt-support
pkgver=2.1.5
pkgrel=1
pkgdesc="register interpreters for various binary formats"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('libpipeline')
makedepends=()
source=(http://ftp.de.debian.org/debian/pool/main/b/binfmt-support/binfmt-support_$pkgver.orig.tar.gz
	binfmt-support.service)
md5sums=('13e241cfd5571c9a2100baf9ab4aedc9'
         '72df6ac607ebfe9eface932b76b66291')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -dm0755 $pkgdir/var/lib/binfmts
  install -Dm755 $srcdir/binfmt-support.service $pkgdir/usr/lib/systemd/system/binfmt-support.service
}
