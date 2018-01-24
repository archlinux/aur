# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgname=dxvk-git
_srcname=dxvk
pkgver=20180124.e4d49ae
pkgrel=1
epoch=
pkgdesc="A Vulkan-based compatibility layer for Direct3D 11 which allows running 3D applications on Linux using Wine."
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
groups=()
depends=('vulkan-icd-loader' 'wine-staging')
makedepends=('ninja' 'meson' 'glslang' 'mingw-w64-gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/doitsujin/dxvk.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()


pkgver() {
        cd "$_srcname"
        git log -1 --format=%cd.%h --date=short|tr -d -
}


build() {
	cd "$_srcname"
	meson --cross-file build-win64.txt build.w64
	cd build.w64
        meson configure -Dprefix=/usr/local/ -Dbuildtype=release
        ninja
}



package() {
	cd "$_srcname"/build.w64
	DESTDIR="$pkgdir/" ninja install
}
