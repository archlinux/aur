# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=roguesynth-git
_gitname=rogue
pkgver=414.9f80a2a
pkgrel=3
pkgdesc="Multimode softsynth with LV2 interface"
arch=(i686 x86_64)
url="https://github.com/timowest/rogue"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'lvtk-git' 'fftw' 'qt4' 'libsamplerate')
makedepends=('python-rdflib')
source=('git://github.com/timowest/rogue.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  sed -i -e 's/lvtk-plugin-1/lvtk-plugin-2/' -e 's/lvtk-ui-1/lvtk-ui-2/' Makefile
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
}
