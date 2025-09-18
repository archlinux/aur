# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='ghostmirror'
pkgname=($prj)
pkgdesc='modern alternative to reflector, true check mirror status, mirror download speed and more.'
pkgver='0.16.3'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('fc9c65a6e1c753e1dfd9eea7a96f93f8f48641790b0aa10561602784168873fd')

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

