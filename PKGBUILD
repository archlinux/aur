# Maintainer: eightscrow
pkgname=omarchy-circle-to-search
pkgver=2.2.1
pkgrel=1
pkgdesc="Draw to select and search with Google Lens — Omarchy edition"
arch=('any')
url="https://github.com/eightscrow/omarchy-circle-to-search"
license=('MIT')
depends=(
    'python'
    'python-cairo'
    'python-gobject'
    'python-pillow'
    'gtk3'
    'gtk-layer-shell'
    'grim'
    'wl-clipboard'
    'hyprland'
    'tesseract'
    'tesseract-data-eng'
    'python-pytesseract'
)
optdepends=(
    'ollama: local AI translation support'
    'libnotify: desktop notifications'
    'xdg-utils: fallback URL opening'
)
provides=('circle-to-search')
conflicts=('circle-to-search')
install=omarchy-circle-to-search.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3795bf985873d755900d8c0d3a7286f91cff0da22f269b945633e39fa40e1d9f')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main entry point
    install -Dm755 circle-to-search.py "${pkgdir}/usr/bin/circle-to-search"

    # Install Python package (cts/)
    local _pydir="${pkgdir}/usr/lib/circle-to-search/cts"
    install -dm755 "${_pydir}"
    install -Dm644 cts/__init__.py "${_pydir}/__init__.py"
    install -Dm644 cts/capture.py "${_pydir}/capture.py"
    install -Dm644 cts/config.py "${_pydir}/config.py"
    install -Dm644 cts/dialogs.py "${_pydir}/dialogs.py"
    install -Dm644 cts/drawing.py "${_pydir}/drawing.py"
    install -Dm644 cts/lock.py "${_pydir}/lock.py"
    install -Dm644 cts/ocr.py "${_pydir}/ocr.py"
    install -Dm644 cts/overlay_live.py "${_pydir}/overlay_live.py"
    install -Dm644 cts/upload.py "${_pydir}/upload.py"

    # Install Hyprland keybind config snippet
    install -Dm644 hyprland-binds.conf "${pkgdir}/usr/share/circle-to-search/hyprland-binds.conf"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
