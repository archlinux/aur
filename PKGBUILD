# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.17.9'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('b739f4cf4c4c7f150dbf640e6ab0489ce2068565bc7a981fff31ee45069ad829')

makedepends=('meson' 'perl' 'ninja')
depends=('curl' 'zlib-ng' 'systemd-libs')

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

