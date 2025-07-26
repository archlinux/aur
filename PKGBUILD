# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=cavasik
pkgver=v3.1.2
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
sha512sums=('a7d84e766f930cb61dbcae10e4193a72083f656ee0bd4b2b3f3e2bbd84c351de340c62818e561c45d66cc2f2fbefa15f307b7b2b666bb8a74c40fbb8ba25a3d8')

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
