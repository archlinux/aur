# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=libvlcpp-git
epoch=1
pkgver=0.281.f3db793
pkgrel=1
pkgdesc="C++ bindings for libvlc"
arch=('i686' 'x86_64')
url="http://vlmc.org/"
license=('GPL')
depends=('vlc')
makedepends=('git')
source=(
  'git+https://code.videolan.org/videolan/libvlcpp.git'
)

sha256sums=(
  'SKIP'
)
provides=('libvlcpp')
conflicts=('libvlcpp')
_gitname="libvlcpp"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make "DESTDIR=${pkgdir}" install
}
