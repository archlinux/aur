# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Yangtse Su <yangtsesu@gmail.com>

pkgbase=alibaba-puhuiti
pkgname=({eot,otf,ttf,woff,woff2}-alibaba-puhuiti alibaba-puhuiti-fontconfig)
pkgver=3.0
pkgrel=2
pkgdesc="Alibaba PuHuiTi fonts"
arch=(any)
license=(LicenseRef-AlibabaPuHuiTi)
_zipname=AlibabaPuHuiTi-3
url=https://www.alibabafonts.com
source=("https://puhuiti.oss-cn-hangzhou.aliyuncs.com/$_zipname.zip"
        75-alibaba.conf
		AlibabaPuHuiTi.md)
sha512sums=('56172a008988f67e34f7282157f5e526b3f4f08915642573ae6d019ed31b22a571a6c759edcd068ab5d587a9ae74dfc0b0696a16ea4be1eb3a6e6266b60af99e'
            '06b3334eea6a9af4b1c8ac3d78a9ecc5cfdccae81dfeeaddc1b3c7f26baa450828952b8460b2f3bd3a03c8c03e4e818c80f97aa9355abc113d0924e82f833366'
            '72129bbadfdfd015937b5320dcca22d5686f0ee7fc034f5beb7c40ee4260cc9d2ccd3014747a41355372fa9cc54282945a6021cfe07dc1c98e3b54b22fa4b334')

_package_common () {
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 AlibabaPuHuiTi.md "$pkgdir/usr/share/licenses/$pkgname"

	install -dm755 "$pkgdir/usr/share/fonts/alibaba/$pkgname"
	install -Dm644 "$_zipname"/*/*.$1 "$pkgdir/usr/share/fonts/alibaba/$pkgname"
}

package_otf-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - OTF format"
	depends=(alibaba-puhuiti-fontconfig)
	_package_common otf
}

package_ttf-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - TTF format"
	provides=(alibaba-puhuiti alibaba-sans)
	replaces=(alibaba-puhuiti alibaba-sans)
	depends=(alibaba-puhuiti-fontconfig)
	_package_common ttf
}

package_woff-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - WOFF format"
	_package_common woff
}

package_eot-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - EOT format"
	_package_common eot
}

package_woff2-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - WOFF2 format"
	_package_common woff2
}

package_alibaba-puhuiti-fontconfig () {
	pkgdesc="$pkgdesc - Fontconfig configuration"
	conflicts=(alibaba-puhuiti alibaba-sans)
	install -dm755 "${pkgdir}/usr/share/fontconfig/conf.default"
	install -Dm644 ${srcdir}/75-alibaba.conf \
		"${pkgdir}/usr/share/fontconfig/conf.avail/75-alibaba.conf"
	ln -nsf /usr/share/fontconfig/conf.avail/75-alibaba.conf \
		"${pkgdir}/usr/share/fontconfig/conf.default/75-alibaba.conf"
}
