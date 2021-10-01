# Maintainer: John Morris <2e0byo@gmail.com>
pkgname=serial-studio-git
pkgver=1.0.23.r131.4a01aca
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://github.com/Serial-Studio/Serial-Studio"
license=('MIT')
groups=()
depends=(
    "qt6-serialport"
    "qt6-quickcontrols2"
    "qt6-5compat"
    "qt6-base"
    "qt6-svg"
    )
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('serial-studio::git+https://github.com/Serial-Studio/Serial-Studio')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  # Git, tags available
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

prepare() {
	  cd "$srcdir/${pkgname%-git}"
    git submodule init
    git submodule update
}

build() {
	  cd "$srcdir/${pkgname%-git}"
    /usr/lib/qt6/bin/qmake
    make -j$(nproc)
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE*
}

