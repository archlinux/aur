# Maintainer: stiglers-eponym
# The default configuration installs the MuPDF version.
pkgname=beamerpresenter-git
pkgver=0.2.0beta
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter (git)"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')

# Dependencies for MuPDF:
# dependence on libharfbuzz.so is implicit because qt5-base depends on fontconfig
depends=('jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=('git' 'libmupdf')

# Dependencies for poppler:
#depends=('poppler-qt5' 'qt5-multimedia' 'hicolor-icon-theme')
#makedepends=('git')

conflicts=('beamerpresenter')
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
  qmake RENDERER=mupdf && make
  #qmake RENDERER=poppler && make
}

package() {
  cd "${srcdir}/BeamerPresenter"
  make install INSTALL_ROOT="${pkgdir}"
}
