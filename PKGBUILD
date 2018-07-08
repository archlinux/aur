# Maintainer: Marcin Mikołajczak <me at m4sk dot in>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Esclapion <esclapion at gmail dot com>

_iconset=Plataro
pkgname=${_iconset,,}-icons
pkgver=r82.8476674
pkgrel=1
pkgdesc='An icon theme with emphasis on clarity, colorfulness and flatness'
arch=('any')
url="https://github.com/tsujan/Plataro"
license=('CCPL:cc-by-nc-sa-4.0')
depends=('hicolor-icon-theme')
provides=("${pkgname}=${pkgver}")
source=("git+https://github.com/tsujan/Plataro")
sha512sums=('SKIP')

pkgver() {
    cd $_iconset
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Install icons
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_iconset}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
    rm -rf "$pkgdir"/usr/share/icons/${_iconset}/{COPYING, INSTALL, README.md, .git, .github, .gitattributes, .gitignore, screenshot.jpg}
    # Install license
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    cp -a "${srcdir}"/${_iconset}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
