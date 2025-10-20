# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
pkgname="${_pkgbase}"
pkgver=v2.0.1
pkgrel=1
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('tosu' 'qt6-base' 'qt6-webengine' 'layer-shell-qt')
makedepends=('cmake' 'make' 'gcc')
_tag=6d39cad6520f34f1069a3080eeed82bbb0f59bf1 # git rev-parse "v$pkgver"
source=("${_pkgbase}::git+${url}.git#tag=${_tag}")
sha256sums=('7a0ece0ee43909715ff2b35194ac8a6e28641636d4031807bb56fd37d74dbb45')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    git describe
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

