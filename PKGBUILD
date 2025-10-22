# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.17.5'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('c2b90223754128bbe7bd198a1df244fda8ad6445d04cc6d3e23eef23142c814a')

makedepends=('meson' 'perl' 'ninja')
depends=('curl' 'zlib-ng' 'systemd-libs')

prepare() {
    cd "${prj}-${pkgver}"
    meson setup build -Dprefix=/usr
}

build() {
    cd "${prj}-${pkgver}/build"
    ninja
}

package() {
    cd "${prj}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}

