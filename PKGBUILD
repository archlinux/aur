# Maintainer: VCalV
pkgname=qlipmon-git
pkgver=r19.a2852b2
pkgrel=2
pkgdesc="clipboard manager with rofi plugin and dbus interface"
arch=('x86_64')
url="https://github.com/vcalv/qlipmon"
license=('GPL3')
groups=()
depends=(qt5-base)
makedepends=(git)
checkdepends=()
optdepends=('rofi: for rofi integration')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname".install
changelog=
source=("$pkgname::git+https://github.com/vcalv/qlipmon")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	if [[ ! -d build ]]; then
		mkdir "build"
	fi
	cd "build"
	qmake -o Makefile ../"$pkgname"/QlipMon.pro -spec linux-g++ CONFIG+=release
}

build() {
	cd "build"
	make
}


package() {
	cd "build"
	make install INSTALL_ROOT="$pkgdir/"
}
