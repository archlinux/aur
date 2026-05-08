# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: BYK <bykdev@proton.me>
pkgname=basecalc-git
pkgver=1.2.0.r0.ge703d3b
pkgrel=1
pkgdesc="BaseCalc is a base calculator made in C with GTK4."
arch=('x86_64')
url="https://github.com/TheRealBYK/BaseCalc.git"
license=('GPL')
groups=()
depends=('gtk4')
makedepends=('cmake' 'gcc')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd BaseCalc
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd BaseCalc
	mkdir -p build
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd BaseCalc
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	echo -e "Installing.\n"
	DESTDIR="${pkgdir}" cmake --install build
	echo "Complete!"
}
