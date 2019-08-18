# Maintainer: Maxime Tréca <maxime.treca@gmail.com>

pkgname=mwm-git
pkgver=r197.7e9fab2
pkgrel=1
pkgdesc="A minimal windowchef fork."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/vxid/mwm"
license=('ISC')
depends=("libxcb" "xcb-util-wm")
makedepends=("git" "xproto")
optdepends=("sxhkd" "wmutils-git" "lemonbar")
conflicts=('windowchef')
source=("$pkgname::git+https://github.com/vxid/mwm.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
