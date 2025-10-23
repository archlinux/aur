# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
pkgname=${_pkgbase}
pkgver=2.1.0
pkgrel=3
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
makedepends=('git' 'gcc' 'meson')
_tag=124c96059ee01b3aefc48f6614c49d9fcb217e8d
source=("${_pkgbase}::git+${url}.git?signed#tag=${_tag}")
sha256sums=('322169a9349660d9c8ae914acfa98a155778fa7e7e04ab90861242d60fb804f1')
validpgpkeys=('C6797F75E4A487395E79B2D1413897C051068F03')  # k4zoku <k4zoku@pm.me>

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
    install -Dm644 "res/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    install -Dm644 "dist/${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
