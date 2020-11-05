# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=lemon-lime
pkgver=0.2.7
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
b2sums=('7a2e64955efbd1ff577efbda15b8cc4940a9f0e1045ee3da541ea7cc8a97eae746b60dbcc520f8c912a1de7981d1b3050643abda514cb2f20db82ef1f1a1468b')

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
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)" \
		-DEMBED_TRANSLATIONS=OFF \
		-DEMBED_DOCS=OFF
	ninja

}

package() {
	cd "$srcdir"
	ninja install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
