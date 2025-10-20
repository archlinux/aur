# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
pkgname=${_pkgbase}-git
pkgver=2.0.1.r1.g2076aa9
pkgrel=1
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
provide=("${_pkgbase}")
conflicts=("${_pkgbase}")
makedepends=('git' 'cmake' 'make' 'gcc')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    git describe --long --tags | \
        sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbase}"
    ./build.sh
}

package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 "build/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm644 "src/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    install -Dm644 "distributions/${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
