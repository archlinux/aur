# Maintainer: stiglers-eponym
pkgname=beamerpresenter-git
pkgver=0.2.0alpha0
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')
depends=('poppler-qt5' 'libmupdf' 'libfreetype.so' 'libharfbuzz.so' 'libjpeg' 'jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt5-multimedia' 'hicolor-icon-theme')
conflicts=('beamerpresenter')
makedepends=('git')
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
md5sums=('SKIP')
backup=("etc/xdg/beamerpresenter/beamerpresenter.conf" "etc/xdg/beamerpresenter/gui.json")
install=beamerpresenter.install

pkgver() {
  cd "${srcdir}/BeamerPresenter"
  printf "%s_%s.%s" \
	  "$(sed -n 's/^VERSION *= *\([^ ]\+\)$/\1/p' beamerpresenter.pro)" \
	  "$(git rev-list --count HEAD)" \
	  "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/BeamerPresenter"

  # TODO: option to select PDF engine

  qmake && make
}

package() {
  cd "${srcdir}/BeamerPresenter"
  make install INSTALL_ROOT="${pkgdir}"
}
