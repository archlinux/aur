# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
pkgname=${_pkgbase}-git
pkgver=2.0.1.r4.g81c9fa6
pkgrel=1
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
makedepends=('git' 'gcc' 'meson')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"
    git describe --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${_pkgbase}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"

    cd "${_pkgbase}"
    install -Dm644 "resources/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    install -Dm644 "distributions/${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
