# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

pkgname=gds3d-git
pkgver=r38.1f646a4
pkgrel=1
pkgdesc="An application used for rendering IC (chip) layouts in 3D"
arch=('x86_64')
url="https://github.com/trilomix/GDS3D"
license=('GPL')
depends=('libx11' 'libglvnd')
provides=('gds3d')
conflicts=('gds3d')
makedepends=('git' 'make' 'gcc')
source=("git+https://github.com/trilomix/GDS3D#commit=1f646a43075d21be7654c1485e59d7c82272c74e")
md5sums=('SKIP')

_gitname="GDS3D"

pkgver() {
  cd "$srcdir/$_gitname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make -C linux
}

package() {
  cd "$srcdir/$_gitname/linux"
  install -Dm755 "./GDS3D" "$pkgdir/usr/bin/GDS3D"
}

