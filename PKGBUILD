# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=0.2.3
pkgrel=1
epoch=
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=('x86_64' 'i686')
url="https://github.com/Project-LemonLime/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools' 'cmake' 'ninja')
checkdepends=()
optdepends=('gcc: C and C++ support'
            'fpc: Pascal support'
            'java-environment: Java support'
            'freebasic: BASIC support'
            'python: Python support')
provides=("lemon-lime")
conflicts=("lemon-lime-git")
replaces=()
backup=()
options=()
install=
changelog=

source=(
    "https://github.com/Project-LemonLime/Project_LemonLime/releases/download/${pkgver}/Lemon-${pkgver}-source-all.7z"
)
noextract=("Lemon-${pkgver}-source-all.7z")
sha512sums=('6eaabb89bc19e4a2a37245cc890ce32b9813652fa79c4a71816540e63ab002f5731425c0b4b8bca50ebf8776cdc8cbad7e56311fcfc9e4e2c33eebaf7bf86d3b')
validpgpkeys=()

prepare() {
    cd "$srcdir"
    bsdtar -xvf Lemon-${pkgver}-source-all.7z
}

build() {
	cd "$srcdir"
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DLEMON_BUILD_INFO="Build for Arch Linux" \
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)"
	ninja

}

package() {
	cd "$srcdir"
	ninja install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
