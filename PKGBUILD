# Maintainer: kedap <kedap.dev@protonmail.com>

pkgname=apmpkg-git-dev
_pkgname=apmpkg
pkgver=265.987c5f5
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD de la rama develop"
arch=('any')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'wget' 'fakeroot' 'ruby-bundler')
makedepends=('git' 'cargo')
conflicts=('apmpkg' 'apmpkg-dev')
source=("git+https://github.com/kedap/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git checkout develop >/dev/null
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  git checkout develop
  make CARGOFLAGS="--release --locked"
}

check() {
  cd "$_pkgname"
  make CARGOFLAGS="--release --locked" test
}

package() {
  cd "$_pkgname"
  make PREFIX_INSTALL=${pkgdir} install
}
