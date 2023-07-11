# Maintainer: Calvin Reu <j  dot  calvin  dot  reu at protonmail period com>
# License: MIT
# Repository: https://gitlab.com/calvinreu/kbdmod

pkgname=kbdmod
pkgver=2.1.4
pkgrel=33
epoch=
pkgdesc="modify your keyboard functionality with multi functions per key"
arch=('any')
url="https://gitlab.com/calvinreu/$pkgname"
license=('MIT')
groups=()
depends=(libevdev yaml-cpp interception-tools)
makedepends=(cmake)
checkdepends=(make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/calvinreu/$pkgname/-/archive/v$pkgver/kbdmod-v$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-v$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -Dversion="$pkgver"
	make -j 8
}

check() {
	cd "$pkgname-v$pkgver/build"
	make -k cmake_check_build_system
}

package() {
	echo -e "${RED}this package has to be installed as root${NOCOLOR}\nuse pacman -U to install the package"
	cd "$pkgname-v$pkgver"
	
	install -Dm 755 build/kbdmod.bin $pkgdir/usr/bin/kbdmod
	echo "kbdmod installed to $pkgdir/kbdmod"


	install -Dm 600 templates/mouse_props.yaml "$pkgdir/etc/interception/properties/mouse.yaml"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/kbdmod/LICENSE"
	echo "LICENSE installed to /usr/share/licenses/kbdmod/LICENSE"

	install -Dm 644 README.md "$pkgdir/usr/share/doc/kbdmod/README.md"
	echo "README.md installed to /usr/share/doc/kbdmod/README.md"

	install -Dm 644 doc/* "$pkgdir/usr/share/doc/kbdmod/"
	echo "doc installed to /usr/share/doc/kbdmod/"

	install -Dm 644 examples/laptop.yaml "$pkgdir/usr/share/doc/kbdmod/examples/laptop.yaml"
	echo "laptop.yaml installed to /usr/share/doc/kbdmod/examples/laptop.yaml"

#check if cowsay is installed
if [ -x "$(command -v cowsay)" ]; then
	cowsay "ya installed kbdmod successfully"
else
	echo '_________________________________
<ya installed kbmod successfully> 
---------------------------------
        \   ^__^ 
         \  (oo)\_______ 
            (__)\       )\/\ 
                ||----w | 
                ||     ||'
fi

	
}
sha256sums=('39cb63d46f192b60581e51ec57a72d8ff171e0169da403126f46545d21efefee')
