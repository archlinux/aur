# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
pkgname=${_pkgbase}
pkgver=2.1.0
pkgrel=1
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
makedepends=('git' 'gcc' 'meson')
_tag=1fce22e547b5f3d74dbe16e8634677376d888a36
source=("${_pkgbase}::git+${url}.git#tag=${_tag}")
sha256sums=('322169a9349660d9c8ae914acfa98a155778fa7e7e04ab90861242d60fb804f1')

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
