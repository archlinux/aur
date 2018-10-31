# Maintainer: Elimpfor <aur@s403.33mail.com>
pkgname=opmsg
pkgver=1.78s
_pkgver=rel-"${pkgver}"
pkgrel=1
epoch=
pkgdesc="opmsg message encryption"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/stealth/opmsg"
license=('GPL3')
depends=('openssl')
source=("https://github.com/stealth/${pkgname}/archive/${_pkgver}.tar.gz")
sha1sums=('d441fdf82c5af723766c30ca76ac07ef68a82db7')
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
