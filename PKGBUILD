# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=klar
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimalist OSD that shows visual indicators for brightness, audio, and power events"
arch=('any')
url="https://github.com/isaksamsten/klar"
license=('MIT')
depends=(python python-pulsectl python-gobject glib2 libadwaita gtk4-layer-shell gtk4)
makedepends=(git python-build python-installer python-hatchling)
_tag=bf45ed3da50fc4ba72f60118f6f2956292dc992f
source=("git+${url}.git#tag=${_tag}")
sha256sums=('90f39f9ade0dcf96888e5e511c3c3bf335df415bfaa0e96a898be6356a2d910e')

pkgver() {
    cd "${pkgname}"
    git describe --tags
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
