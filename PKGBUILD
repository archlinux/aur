# Maintainer: Autumn McKee <autumn AT mck DOT is>

pkgname=ocean-icons-git
pkgver=r24.e1f17e7
pkgrel=1
epoch=1
pkgdesc='Icon theme by the KDE Visual Design Group'
arch=('any')
url='https://invent.kde.org/abetts/ocean-design'
license=('LicenseRef-unknown')
depends=('hicolor-icon-theme')
makedepends=('git')
provides=('ocean-icons')
conflicts=('ocean-icons')
options=('!strip' '!debug')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/ocean-design"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/ocean-design/Icon Pack/Ocean" "${pkgdir}/usr/share/icons/"

    cd "${pkgdir}/usr/share/icons/Ocean"

    rm -f icon-theme.cache

    # GTK's cache validator rejects icon names containing spaces.
    find . \( -type f -o -type l \) -name '* *' -delete
}
