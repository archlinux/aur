# Maintainer: Marco Migozzi <https://github.com/ToRvaLDz>
pkgname=ii-material-sddm-git
pkgver=r.1
pkgrel=1
pkgdesc="Material Design 3 SDDM theme inspired by the ii lockscreen from end-4/dots-hyprland"
arch=('any')
url="https://github.com/ToRvaLDz/ii-material-sddm"
license=('GPL-3.0-only')
depends=('sddm')
optdepends=(
    'qt6-5compat: blur effects'
    'acl: automatic matugen color/wallpaper sync'
    'ttf-google-sans: clock and UI font'
)
makedepends=('git')
provides=('ii-material-sddm')
conflicts=('ii-material-sddm')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    local theme_dir="${pkgdir}/usr/share/sddm/themes/ii-material-sddm"

    install -d "${theme_dir}/Components" "${theme_dir}/Backgrounds"
    install -m644 Main.qml metadata.desktop theme.conf translations.js "${theme_dir}/"
    install -m644 colors.json "${theme_dir}/" 2>/dev/null || true
    install -m644 Components/*.qml "${theme_dir}/Components/"
    install -m644 Backgrounds/* "${theme_dir}/Backgrounds/" 2>/dev/null || true
}
