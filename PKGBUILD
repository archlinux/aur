# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=1.0.3
pkgrel=2
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=("${url}/releases/download/${pkgver}/${_pkgname}.zip"
		"liteloader-qqnt-depatch.hook"
		"liteloader-qqnt-patch.hook")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader"
	mkdir -p "${pkgdir}/opt/QQ/resources/app/application"

	# copy files
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/"
	cp -f "${srcdir}/src/preload.js" "${pkgdir}/opt/QQ/resources/app/application/preload.js"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"

	# clean up in target dir
	rm -f "${pkgdir}/opt/LiteLoader/LiteLoaderQQNT.zip"
	rm -f "${pkgdir}/opt/LiteLoader/liteloader-qqnt-patch.hook"
	rm -f "${pkgdir}/opt/LiteLoader/liteloader-qqnt-depatch.hook"

	# install hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
