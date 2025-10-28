# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.18.1'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('3aeccfbc95c20523dcef4870e1bf53cecc2b6df7f117ecd6a278e9ee7351c9a3')

depends=('curl' 'zlib-ng' 'systemd-libs' 'elfutils')

prepare() {
    cd "${prj}-${pkgver}"
    meson setup build -Dprefix=/usr --buildtype=plain
}

build() {
    cd "${prj}-${pkgver}/build"
    ninja
}

package() {
    cd "${prj}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}

