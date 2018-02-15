pkgname=binfmt-support
pkgver=2.1.8
pkgrel=2
pkgdesc="register interpreters for various binary formats"
arch=(any)
url="http://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('glibc' 'systemd' 'libpipeline')
makedepends=()
source=(
    http://ftp.de.debian.org/debian/pool/main/b/binfmt-support/binfmt-support_$pkgver.orig.tar.gz
    binfmts.service
    )
md5sums=(
    'b86d8a8d310e246f1e02b91366472681'
    '0000a524a3d97583563a0d1d6f6b1ecb'
    )

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -dm0755 $pkgdir/var/lib/binfmts
  install -Dm755 ../binfmts.service $pkgdir/usr/lib/systemd/system/binfmts.service
}
