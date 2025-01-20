#Maintainer:	AImixAE <aimixae@outlook.com>
#Contributor:	Giteeajake <giteeajake@qq.com>

pkgname=gcc-kawaii-plugin-zh
pkgver=0.0.3
pkgrel=1
pkgdesc='a gcc plugin and make your GCC	kawaii :)'
arch=('any')
url="https://github.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0-or-later')
depends=('gcc' 'gettext' 'noto-fonts-cjk')
optdepends=('wqy-zenhei: fonts support'
	'wqy-microhei: fonts support')
source=("${pkgname}::git+${url}")
install="${pkgname}.install"
sha256sums=(SKIP)

build() {
	cd ${srcdir}/${pkgname}
	make
}

check() {
	if [[ ! -f ${srcdir}/${pkgname}/build/zh-kawaii.mo ]]; then
		exit 1
	fi
}

package() {
	rm -rf ${srcdir}${pkgname}/build/ja-kawaii.mo
	rm -rf ${srcdir}${pkgname}/build/zh-origin.mo
	#clean no-need

	#backup
	install -d "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES"

	if [[ -f /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo ]]; then
        	install -m644 /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo \
		"$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo.bak"
	fi

	install -m644 "$srcdir/$pkgname/build/zh-kawaii.mo" \
		"$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo"
}

