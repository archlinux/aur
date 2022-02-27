# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=ext4-crypt
pkgname=${_pkgname}-git
pkgver=r26.df324fe
pkgrel=1
pkgdesc="Userspace tool to create ext4 encrypted directories. Git checkout"
arch=(i686 x86_64)
url="https://github.com/gdelugre/ext4-crypt"
license=('custom')
depends=('keyutils' 'libsodium')
makedepends=('git' 'cmake')
conflicts=($_pkgname)
provides=($_pkgname)
source=(git+https://github.com/gdelugre/${_pkgname}.git)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname/

  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd $_pkgname

  install -Dm755 build/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
