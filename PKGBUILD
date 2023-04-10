# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

pkgname=gds3d-git
pkgver=r38.173da0c
pkgrel=1
pkgdesc="An application used for rendering IC (chip) layouts in 3D"
arch=('x86_64')
url="https://github.com/trilomix/GDS3D"
license=('GPL')
depends=('libx11' 'libglvnd')
provides=('gds3d')
conflicts=('gds3d')
makedepends=('git')
source=("git+https://github.com/trilomix/GDS3D" "0001-linux-Rename-compiler-variables-to-CXX-and-CXXFLAGS.patch" "0002-linux-Build-using-std-c-11.patch")
md5sums=('SKIP' 'SKIP' 'SKIP')

_gitname="GDS3D"

pkgver() {
  cd "$srcdir/$_gitname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname/linux"
  patch --forward --strip=2 --input="${srcdir}/0001-linux-Rename-compiler-variables-to-CXX-and-CXXFLAGS.patch"
  patch --forward --strip=2 --input="${srcdir}/0002-linux-Build-using-std-c-11.patch"
}

build() {
  cd "$srcdir/$_gitname"
  make -C linux
}

package() {
  cd "$srcdir/$_gitname/linux"
  install -Dm755 "./GDS3D" "$pkgdir/usr/bin/GDS3D"
}

