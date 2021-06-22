# Maintainer: John Morris <2e0byo@gmail.com>
pkgname=dymo-cups-drivers-git
pkgver=r27.3986268
pkgrel=1
pkgdesc="Unofficial copy of Dymo's CUPS driver, which seems to have disappeared."
arch=('x86_64')
url="https://github.com/matthiasbock/dymo-cups-drivers"
license=('GPL')
groups=()
depends=(
    "cups"
    "automake"
    "autoconf"
    "gcc"
    )
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname}")
replaces=()
backup=()
options=()
source=('dymo-cups-drivers::git+https://github.com/matthiasbock/dymo-cups-drivers')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	  cd "$srcdir/${pkgname%-git}"
    ./build.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

