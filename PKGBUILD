# Maintainer: pixeljoelson <pixeljoelson@gmail.com>
pkgname=kit-git
pkgver=r252.8aa8a0a
pkgrel=1
pkgdesc="A magical, high performance programming language for game development."
arch=('x86_64')
url="https://kitlang.org"
license=('LGPL3')
groups=()
depends=('gmp')
makedepends=('git' 'stack')
optdepends=('ccache: compilation caching support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/kitlang/kit.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	stack build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	stack install --local-bin-path "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/kit"
	cp -r std/* "$pkgdir/usr/lib/kit"
}
