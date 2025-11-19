# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.18.3'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('73869e262c7e97aa9385b0ca0505eedd1828f8bb623d68ac8d998ad4a8bd2d9f')

makedepends=('meson' 'perl' 'ninja')
depends=('curl' 'zlib-ng' 'systemd-libs' 'elfutils')

prepare() {
    cd "${prj}-${pkgver}"
	meson subprojects update
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

