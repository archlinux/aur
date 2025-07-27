# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=cavasik
pkgver=v3.1.3
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
sha512sums=('0763c47a55fda8535055a4621f63ab128743f13104d174e67922252f31a32f8b096b60f3e587e02dc0e89998c6f55d4cbb57b713fd9a998e260920eff2ca0f1e')

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