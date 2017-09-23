# Maintainer: Emmanuel Boudreault <green7ea@protonmail.ch>

pkgname=matcha-terminal-git
pkgver=r20.52f0156
pkgrel=1
pkgdesc='A simple VTE base terminal emulator.'
arch=('i686' 'x86_64')
url='https://github.com/green7ea/matcha-terminal'
license=('GPL')
depends=('gtk3' 'glibc' 'vte3' 'desktop-file-utils')
makedepends=('git' 'meson' 'ninja' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/green7ea/matcha-terminal.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

  # Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="${pkgdir}" ninja install -C build
}
