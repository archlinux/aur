# Maintainer: Melvin Vermeeren <mail@mel.vin>
pkgname=drawtiming
pkgver=0.7.1
pkgrel=2
pkgdesc="Tool that converts ASCII to UML Timing Diagrams."
arch=('i686' 'x86_64')
url="http://drawtiming.sourceforge.net/"
license=('GPL2')
depends=('imagemagick' 'ghostscript')
source=("https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz"
        "https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz.asc"
        "0001-gcc43.patch"
	"0002-switch_LDFLAGS_LDADD.patch"
	"0003-highlight_rows.patch"
	"0004-drawtiming_cairo.patch"
	"0005-drawtiming-color-support.patch"
	"0006-analog_values.patch"
	"0007-transition_percentage.patch"
	"0008-grid.patch"
	"0009-manpage-fix.patch")
sha256sums=('ae35a369f71f03b219d23f56329ced73100f79ffda38dd8d31d1e9e510f3cf6e'
            'SKIP'
            'e2fc55753c003233ed3797d1b7c1e53cb0d38792cfb94d49b139049f1555da84'
            '088407c2e04b7a0df73cdaeb3a31d2270c5056102b6f9bf2ab38e6b996a47140'
            '917d344f23000f9d53773ef3a5cdc8a0ab5348b2ef6ef4cb47c41c27e4fedca5'
            '2815283a41b6b832aca82e7a26110f358bd01d428dfd5c86e622e8996252c7e0'
            '31eac54da13f61a9c17aceac645f37e98baef9ae3ed840f8c8c5275d70abded2'
            '4ca14d1dbf67ebcd42f449a29a7db36070e19083352de2d11c1dc41989118bb1'
            '2c40999feea0fa1e91f6100c8bc4bab517e5d19182fab6b4f13b2f81a1861005'
            'e19f9d86b550b0d14f9805e79b41d99973aa5ec3999443ee5cf0a5b64eccbc82'
            '29881f7bbac6b06d75813c726132b6971c699e2aefa515720809de06d6acfbb7')
validpgpkeys=('3ABAC00311517945BAF0491140DDCDFB3BF52988') # Edward Counce

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# All patches are from soureforge.
	# Most of them don't work, at least for now.
	patch -p0 -i "${srcdir}/0001-gcc43.patch"
	patch -p1 -i "${srcdir}/0002-switch_LDFLAGS_LDADD.patch"
	#patch -p0 -i "${srcdir}/0003-highlight_rows.patch"
	#patch -p0 -i "${srcdir}/0004-drawtiming_cairo.patch"
	#patch -p2 -i "${srcdir}/0005-drawtiming-color-support.patch"
	patch -p0 -i "${srcdir}/0006-analog_values.patch"
	#patch -p0 -i "${srcdir}/0007-transition_percentage.patch"
	#patch -p0 -i "${srcdir}/0008-grid.patch"
	patch -p1 -i "${srcdir}/0009-manpage-fix.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
