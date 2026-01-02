# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
pkgname=bspwm-git
pkgver=0.9.12.r1508.c5cf7d3
pkgrel=1
pkgdesc='A tiling window manager based on binary space partitioning'
arch=('i686' 'x86_64')
url='https://github.com/baskerville/bspwm'
license=('custom:BSD')
depends=('bash' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
optdepends=('sxhkd-git: to define keyboard and pointer bindings'
            'bar-aint-recursive: for the example panel'
            'xtitle: for the example panel'
            'sutils-git: for the example panel'
            'terminus-font: for the example panel'
            'python: for some scripting examples')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	printf "%s.r%s.%s" \
		"$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname
	make PREFIX=/usr
}

package() {
	cd $srcdir/$pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
