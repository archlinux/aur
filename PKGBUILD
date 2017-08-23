# Maintainer: jo.mei <jo.mei_at_posteo.de>

_gitname=akonadi-ews
pkgname=$_gitname-git
pkgver=r380.ed9acfa
pkgrel=1
pkgdesc="Resource agent for Microsoft Exchange using Exchange Web Services (EWS) protocol"
arch=('i686' 'x86_64')
url="https://github.com/KrissN/$_gitname/"
license=('GPL')
depends=('kcalcore' 'akonadi-mime' 'hicolor-icon-theme' 'kcontacts')
makedepends=('extra-cmake-modules' 'boost' 'kdesignerplugin')
conflicts=("$_gitname")
provides=("$_gitname")
source=("git+https://github.com/KrissN/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
