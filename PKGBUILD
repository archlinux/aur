# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: José Luis Lafuente <jl@lafuente.me>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>

pkgname=watchman
pkgver=4.9.0
pkgrel=1
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('pcre')
makedepends=('glibc')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/watchman/archive/v$pkgver.tar.gz"
        "$pkgname.tmpfiles")
sha256sums=('1f6402dc70b1d056fffc3748f2fdcecff730d8843bb6936de395b3443ce05322'
            '2b061865e10578a0477b9c7991a00594bc839c846b98896e93c75743dbf6a379')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix= --exec-prefix=/usr --localstatedir=/run/$pkgname --without-python --enable-lenient
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Docs available online only; see https://github.com/facebook/watchman/issues/30
  make DESTDIR=$pkgdir install-binPROGRAMS

  install -Dm 644 ../$pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
}

# vim:set ts=2 sw=2 et:
