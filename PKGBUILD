# Maintainer: MoetaYuko <loli[at]yuko[dot]moe>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Magnus Bergmark <magnus.bergmark@gmail.com>

_pkgname=rofi-emoji
pkgname=$_pkgname-abi8
pkgver=3.2.0
pkgrel=1
pkgdesc='A Rofi plugin for selecting emojis'
url='https://github.com/Mange/rofi-emoji'
arch=('x86_64')
license=('MIT')
depends=('rofi')
provides=($_pkgname)
conflicts=($_pkgname)
checkdepends=('check')
optdepends=(
	'xsel: X11 support'
	'xclip: X11 support'
	'wl-clipboard: Wayland support'
)
source=(
	https://github.com/Mange/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz
	abi8.patch::https://github.com/Mange/rofi-emoji/commit/8c7083eeccc577dcd9bb26bf4b67f80c9451d697.patch
)
b2sums=('a97da1cdbae7ecf66e39f9700ee0f2b5f47254f315bfef611cc4f98483587d876135c16eb94319d1844598bbd85864e1b1175ebdedd86dac6585b57887d5ca1a'
        '94e0c4a20c030d67554c8f5e5f2229c447990a250d06d657b186a946b5045e2dd39551201f12cf052806f3dc8568bd2a1e53abdde98188581c92fcadaadf73b3')

prepare() {
	cd ${_pkgname}-${pkgver}
	patch -p1 -i $srcdir/abi8.patch
}

build() {
	cd ${_pkgname}-${pkgver}
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd ${_pkgname}-${pkgver}
	make check
}

package() {
	cd ${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
