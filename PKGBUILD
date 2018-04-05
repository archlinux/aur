# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=darkine-kde-git
pkgver=1.4.r23.g37b765d
pkgrel=1
pkgdesc="Theme based on Adapta KDE for Plasma 5 desktop"
arch=('any')
url="https://github.com/Rokin05/darkine-kde"
license=('GPL3')
optdepends=('konsole: For the Konsole color scheme'
            'kvantum-qt5: For the Qt application style'
            'kwin: For the Aurorae theme'
            'papirus-icon-theme: For the Papirus-Adapta icon theme'
            'plasma-desktop: For the Plasma theme'
            'sddm: For the SDDM theme')
makedepends=('git' 'make')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    ver="$(grep '#### Version' CHANGELOG.md | tail -1 | awk '{print $3}')"
    printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    make -C "${pkgname%-*}" PREFIX=/usr DESTDIR="${pkgdir}/" install
}
