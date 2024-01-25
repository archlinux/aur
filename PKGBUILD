# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=callisto-git
pkgver=v0.1.0.r97.g019fea4
pkgrel=1
pkgdesc='standalone scripting platform for Lua 5.4'
arch=('x86_64')
url='https://github.com/jtbx/callisto'
makedepends=('git')
license=('GPL')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/jtbx/callisto.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make -j$(nproc)
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
