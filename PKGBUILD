# Maintainer: Elimpfor <aur@s403.33mail.com>
pkgname=opmsg
pkgver=1.75s
_pkgver=rel-"${pkgver}"-newskey2
pkgrel=1
epoch=
pkgdesc="opmsg message encryption"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/stealth/opmsg"
license=('GPL3')
depends=('openssl')
source=("https://github.com/stealth/${pkgname}/archive/${_pkgver}.tar.gz")
sha1sums=('9959faa3b3f07d55abd769d1ad5427be331893e6')
conflicts=('opmsg-git')

build() {
	cd "$pkgname-$_pkgver/src"
	make
	make contrib
}

package() {
	cd "${srcdir}/$pkgname-$_pkgver"
	mkdir -p "$pkgdir/usr/share/opmsg"
	install -D -m644 sample.config "$pkgdir/usr/share/opmsg"
	cd "${srcdir}/$pkgname-$_pkgver/src"
	install -D -m755 opmsg "$pkgdir/usr/bin/opmsg"
	install -D -m755 opmux "$pkgdir/usr/bin/opmux"
	install -D -m755 opcoin "$pkgdir/usr/bin/opcoin"
}
