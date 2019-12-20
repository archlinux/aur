# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Joermungand <joermungand at gmail dot com>

pkgname=avldrums-lv2-git
pkgver=0.4.1.r0.gc1e168d
pkgrel=1
pkgdesc="Dedicated AVLDrumkits LV2 Plugin from x42"
arch=('i686' 'x86_64')
url="https://github.com/x42/avldrums.lv2"
license=('GPL2')
groups=('lv2-plugins')
depends=('pango' 'libglvnd')
makedepends=('git' 'lv2' 'glu' 'xorgproto')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/x42/avldrums.lv2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
    make submodules
    make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}

