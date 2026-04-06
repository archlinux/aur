# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: BYK <bykdev@proton.me>
pkgname=basecalc-git
pkgver=1.0.1
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
	DESTDIR="${pkgdir}" cmake --install build
	mkdir -p "${pkgdir}/usr/share/applications/"
	echo -e "Creating Desktop Entry.\n"
	echo -e "Filling Desktop Entry.\n"
	echo -e "[Desktop Entry]\nType=Application\nVersion=$pkgver\nName=BaseCalc\nComment=A Base Calculator.\nExec=BaseCalc\nIcon=/usr/share/icons/BaseCalc.svg\nTerminal=false\nCategories=Utility;Development;" > BaseCalc.desktop
	echo -e "Installing.\n"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 BaseCalc.desktop "${pkgdir}/usr/share/applications/BaseCalc.desktop"
	update-desktop-database
	echo "Complete!"
}
