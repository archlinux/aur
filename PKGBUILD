# Maintainer: Mike Sampson <mike@sambodata.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="lcdtest"
pkgver=1.18
pkgrel=1
pkgdesc="A utility to display LCD monitor test patterns."
arch=('i686' 'x86_64')
url="http://www.brouhaha.com/~eric/software/lcdtest/"
license=('GPL2')
depends=('sdl_image' 'sdl_ttf' 'ttf-liberation')
makedepends=('scons')
source=("http://www.brouhaha.com/~eric/software/lcdtest/download/${pkgname}-${pkgver}.tar.gz" patch)

md5sums=('d94f242f0ff35c75d6f4be89d3bc13d6'
         '97ad0f31a07d8258e42c3078db8202c6')
sha512sums=('74b0739c5dcc5ff9307ca526b4a6bbd92d6e58a83ceeed5a37a4064e3e4ed0cbdfe7a2a70cd56ba1a7305c3fd72510e10a02098aab11828062a3999cac944ab7'
            '73908be71d58a3afd5a71ef7f64293220b1b4b7e146792d436fb73282f8baa61c0e2d5434fc9c06e4d6b0bb591a2a0e6bbca10fee9b6c90d7fe6a1a56d121422')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	patch -p1 < $srcdir/patch
	scons
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	install -d -m0755 ${pkgdir}/usr/bin
	install -m0755 ${srcdir}/${pkgname}-${pkgver}/build/${pkgname} ${pkgdir}/usr/bin
	install -d -m0755 ${pkgdir}/usr/share/man/man1
	install -m0644 ${srcdir}/${pkgname}-${pkgver}/man/${pkgname}.1 ${pkgdir}/usr/share/man/man1
}

# vim:ts=4:sw=4:noet:
