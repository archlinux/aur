# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=curv
pkgname="$_pkgname-git"
pkgver=0.3.r50.g1bb201b
pkgrel=1
pkgdesc="a language for making art using mathematics"
url="https://github.com/doug-moen/curv"
arch=('x86_64')
license=('Apache')
makedepends=('cmake' 'git' 'boost' 'openexr' 'glm')
depends=('boost-libs' 'double-conversion' 'ilmbase' 'intel-tbb')

source=("git+https://github.com/doug-moen/curv")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init

  mkdir -p release
  cd release
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr ..
}

build() {
  cd "$_pkgname"/release
  make
}

package() {
  cd "$_pkgname"/release
  make install
}
