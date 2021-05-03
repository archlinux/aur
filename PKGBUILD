# Maintainer: stiglers-eponym
# The default configuration installs the MuPDF version.
_renderer=mupdf
pkgname=beamerpresenter
pkgver=0.2.0
pkgrel=1
pkgdesc="Modular multi-screen pdf presenter"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('AGPL3')

# Dependencies when using MuPDF:
depends=('jbig2dec' 'openjpeg2' 'gumbo-parser' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=('libmupdf')

optdepends=('gst-libav: show videos' 'gst-plugins-good: show videos')
conflicts=('beamerpresenter-git')
backup=("etc/xdg/${pkgname}/${pkgname}.conf" "etc/xdg/${pkgname}/gui.json")
install=beamerpresenter.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('524a3509cafebf5ced7fad3bfb1c4b35267913baebd142885a74e029d37812e9')

# Change depends and makedepends if poppler is used as renderer.
if [ "${_renderer}" == "poppler" ]; then
    # Dependencies when using poppler:
    depends=('poppler-qt5' 'qt5-multimedia' 'hicolor-icon-theme')
    makedepends=()
fi

build() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"
  qmake RENDERER="${_renderer}" && make
}

package() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
