# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=libqdark-git
pkgver=0.3.r2.g46eb441
pkgrel=1
pkgdesc="Plugin for Qt applications. Choose the dark side of the style."
arch=('i686' 'x86_64')
url="http://github.com/suratovvlad/libqdark"
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("${pkgname%-*}::git+https://github.com/suratovvlad/libqdark.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}


build() {
    cd ${pkgname%-*}
    git submodule update --init
    qmake-qt5 libqdark.pro
    make
}

package() {
    cd ${pkgname%-*}
    make INSTALL_ROOT="$pkgdir" install
}