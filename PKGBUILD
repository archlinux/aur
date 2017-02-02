# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: falkTX <falktx [at] gmail [dot] com>

pkgname=carla
pkgver=1.9.7
pkgrel=5
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('file' 'fftw' 'fluidsynth' 'glu' 'liblo' 'linuxsampler' 'mxml' 'ntk-git' 'projectm' 'python' 'python-pyqt5' 'qt5-svg' 'zlib')
makedepends=('gtk2' 'gtk3' 'python-pyliblo' 'python-rdflib' 'qt4' 'zynaddsubfx')
optdepends=(
  'gtk2: LV2 GTK2 UI support'
  'gtk3: LV2 GTK3 UI support'
  'python-pyliblo: OSC support'
  'python-rdflib: LADSPA-RDF support'
  'qt4: LV2 QT4 UI support'
  'zynaddsubfx: ZynAddSubFX banks'
)
source=("https://github.com/falkTX/Carla/archive/${pkgver}.tar.gz"
        "pyqt.patch::https://github.com/falkTX/Carla/commit/9ff1711b8fdf0acb4608498463ed4608889ead1e.patch")
sha512sums=('f8b7247eace54a49398800a377efa9fb88267d52ccd0297a6fb4b64c04da24ac10260bdfe8ee8f7d15e13928dcc15c3e84a66f7c97c6a11c2bbe0e74b1d60587'
            'c445de23aa7b8d3c4d62826d063994a3971f2abc743334e558785d11667a3aa6c23ee6bdfeaf1383f3868f47856091cf7905330d09a37144f5e232e49571b107')

prepare() {
  cd "Carla-${pkgver}"
  # Upstream patch to fix issues with PyQT
  patch -Np1 -i ${srcdir}/pyqt.patch
}

build() {
  cd "Carla-${pkgver}"
  make DEFAULT_QT=5
}

package() {
  cd "Carla-${pkgver}"
  make DEFAULT_QT=5 DESTDIR="${pkgdir}/" PREFIX=/usr install
}
