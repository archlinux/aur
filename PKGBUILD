# Maintainer: M. Damian "G'lek" Mulligan <glek at glektarssza dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=arc-icon-theme-full-git
pkgver=1.0.r114.gbfce0c2e83
pkgrel=1
pkgdesc='The complete Arc icon theme'
arch=('any')
url='https://github.com/rtlewis88/rtl88-Themes/tree/Arc-ICONS'
license=('GPL3')
makedepends=('git')
depends=('gtk-update-icon-cache' 'moka-icon-theme')
optdepends=(
    'arc-gtk-theme: GTK theming with transparency'
    'arc-solid-gtk-theme: GTK theming without transparency'
)
source=('git+https://github.com/rtlewis88/rtl88-Themes.git#branch=Arc-ICONS')
sha256sums=('SKIP')
replaces=('arc-icon-theme')
provides=('arc-icon-theme')
conflicts=('arc-icon-theme')
options=('!strip')

pkgver() {
    cd "${srcdir}/rtl88-Themes/Arc-ICONS" > /dev/null || exit 1
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/rtl88-Themes/Arc-ICONS" > /dev/null || exit 1
    # -- GTK icon cache HATES filenames with spaces!
    mv 'apps/128/Borderlands 2.png' 'apps/128/Borderlands2.png'
    mv 'apps/128@2x/Borderlands 2.png' 'apps/128@2x/Borderlands2.png'
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons/Arc-ICONS"
    cp -r "${srcdir}"/rtl88-Themes/Arc-ICONS/* "${pkgdir}/usr/share/icons/Arc-ICONS/"
}
