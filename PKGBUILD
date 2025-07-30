# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=cavasik
pkgver=v3.2.0
pkgrel=1
pkgdesc="Audio visualizer based on CAVA"
arch=('any')
url="https://github.com/TheWisker/Cavasik"
license=('GPL-3.0-or-later')
depends=('cava' 'libadwaita' 'python' 'python-gobject' 'python-cairo' 'python-pydbus' 'glib2' 'hicolor-icon-theme' 'gtk4' 'dconf')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=()
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/TheWisker/Cavasik#tag=${pkgver}")
noextract=()
validpgpkeys=()
sha512sums=('4a3c58e437d2c44fd5aa39e2c2f1cb7d97d9447e014dd71c97d58b5dffe0a9137444a2864d6f1618c5c98db4d694243a1fe41370a867d41a54e91d3065f1ac29')

build() {
    arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}/build"
    meson compile -C "${srcdir}/${pkgname}-${pkgver}/build"
}

check() {
    meson test -C "${srcdir}/${pkgname}-${pkgver}/build" --print-errorlog
}

package() {
    meson install -C "${srcdir}/${pkgname}-${pkgver}/build" --destdir "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/cavasik"
}