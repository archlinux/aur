# Maintainer:  gilcu3
# Contributor: gilcu3

_pkgname=thunarx-python
pkgname=$_pkgname-git
pkgver=0.5.2.r138.67c9983
pkgrel=1
pkgdesc="Thunarx Python Bindings"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://goodies.xfce.org/projects/bindings/thunarx-python'
depends=('thunar>=1.7.0' 'python-gobject')
provides=("thunarx-python")
conflicts=('thunarx-python')
replaces=('python-thunarx-git')
license=('GPL')
sha256sums=('SKIP')
source=("git+https://gitlab.xfce.org/bindings/${_pkgname}.git")

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  TAG="${TAG##*-}"
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
