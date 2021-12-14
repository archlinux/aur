# Maintainer: John Morris <2e0byo@gmail.com>
pkgname=serial-studio-git
pkgver=continuous.r0.d3ef5f5
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://github.com/Serial-Studio/Serial-Studio"
license=('MIT')
groups=()
depends=(
    "qt5-charts"
    "qt5-serialport"
    "qt5-quickcontrols2"
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
    qmake
    make -j$(nproc)
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE*
}

