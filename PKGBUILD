# Maintainer:  gilcu3
# Contributor: gilcu3

_pkgname=python-thunarx
pkgname=$_pkgname-git
epoch=1
pkgver=0.5.2.r138.67c9983
pkgrel=1
pkgdesc="Thunarx Python Bindings"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://goodies.xfce.org/projects/bindings/thunarx-python'
depends=('thunar>=1.7.0' 'python-gobject')
provides=("python-thunarx")
conflicts=('python-thunarx')
replaces=('python-thunarx')
license=('GPL')
sha256sums=('SKIP')
opkgname=thunarx-python
source=("git+https://gitlab.xfce.org/bindings/${opkgname}.git")

pkgver() {
  cd $opkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  TAG="${TAG##*-}"
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

build() {
  cd "${srcdir}/${opkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${opkgname}"
  make DESTDIR="${pkgdir}" install
}
