# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=gxplugins-lv2-git
pkgver=r121.f1a6cc9
pkgrel=1
pkgdesc="A set of extra lv2 plugins from the guitarix project."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/GxPlugins.lv2"
license=('GPL3')
groups=('lv2-plugins')
depends=('cairo')
makedepends=('git' 'lv2' 'libxext' 'freetype2' 'xorgproto')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "gx-lv2-git")
source=("${pkgname%-*}::git+https://github.com/brummer10/GxPlugins.lv2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
}

build() {
	cd "$srcdir/${pkgname%-*}"
	git submodule init
	git submodule update
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}

