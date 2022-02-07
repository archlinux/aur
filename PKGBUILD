# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=lemon-lime
pkgver=0.3.2.1
pkgrel=2
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
options=(debug strip)
install=
changelog=

source=(
    "https://github.com/Project-LemonLime/Project_LemonLime/releases/download/${pkgver}/Lemon-${pkgver}-source-all.7z"
)
noextract=("Lemon-${pkgver}-source-all.7z")
b2sums=('9114635e62ecef591525fff8f8f361c5ae8cf766bb61d013a2ea63d3f662ee297e85f0aaa9bb2809caf4f3d199b46a32bdc4a146c49c7f6d11978a3900afafb6')

prepare() {
    cd "$srcdir"
    bsdtar -xvf Lemon-${pkgver}-source-all.7z
}

build() {
	cd "$srcdir"
	cmake -S. -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DLEMON_BUILD_INFO="Build for Arch Linux" \
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)" \
		-DEMBED_TRANSLATIONS=OFF \
		-DEMBED_DOCS=OFF
	ninja -C build

}

package() {
	cd "$srcdir"
	ninja -C build install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
