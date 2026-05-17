# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>

pkgname=echo-sddm-git
pkgver=r14.cbb1403
pkgrel=1
pkgdesc="macOS Terminal-inspired SDDM login theme — frosted glass, boot animation, dual login modes"
arch=('any')
url="https://github.com/xCaptaiN09/echo-sddm"
license=('MIT')
install=echo-sddm.install
depends=('sddm' 'qt6-declarative' 'qt6-5compat')
optdepends=('ttf-jetbrains-mono: recommended font')
source=("git+https://github.com/xCaptaiN09/echo-sddm.git")
sha256sums=('SKIP')

pkgver() {
    cd echo-sddm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    _theme="${pkgdir}/usr/share/sddm/themes/echo"
    install -dm755 "${_theme}/assets/backgrounds"

    install -m644 "${srcdir}/echo-sddm/Main.qml" "${_theme}/"
    install -m644 "${srcdir}/echo-sddm/metadata.desktop" "${_theme}/"
    install -m644 "${srcdir}/echo-sddm/theme.conf" "${_theme}/"
    install -m644 "${srcdir}/echo-sddm/install.sh" "${_theme}/"

    cp -r "${srcdir}/echo-sddm/assets/"* "${_theme}/assets/" 2>/dev/null || true

    install -Dm644 "${srcdir}/echo-sddm/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
