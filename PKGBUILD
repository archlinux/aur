# Maintainer: itonia149

pkgname=system-tray-browser
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE-friendly system tray popup browser'
arch=('any')
url='https://github.com/itonia149/system-tray-browser'
license=('MIT')
depends=(
  'python'
  'pyside6'
  'qt6-webengine'
  'python-adblock'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 share/applications/system-tray-browser.desktop \
    "${pkgdir}/usr/share/applications/system-tray-browser.desktop"
  install -Dm644 system_tray_browser/assets/system-tray-browser.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/system-tray-browser.svg"
}
