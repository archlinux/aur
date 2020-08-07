# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gitname=CuteMarkEd-NG
pkgname=cutemarked-git
pkgver=20200625.r910
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/Waqar144/${_gitname}"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-webengine' 'hunspell' 'discount' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools')
provides=('cutemarked')
conflicts=('cutemarked')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
   printf "%s.r%s" $(git log -1 --format="%cd" --date=short | tr -d '-') $(git rev-list --count HEAD)
}

prepare() {
  cd $_gitname
  git submodule init
  git submodule update
}

build() {
  cd $_gitname
  [[ -d build ]] || mkdir build
  cd build
  qmake ..
  make
}

package() {
  cd $_gitname/build
  make INSTALL_ROOT="$pkgdir" install
}
