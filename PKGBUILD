# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.18.5'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('6e4ae9685ca4d82e6202336d0ec27387b676473110d453171b194145c5b234cc')

makedepends=('meson' 'perl' 'ninja' 'git')
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

