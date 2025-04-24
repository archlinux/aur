# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
pkgname=${_pkgname}-zh-cn
pkgver=0.10
pkgrel=2
pkgdesc="Surrealistic adventure game about exploring the dreams of a hikikomori character named Madotsuki (Simplified chinese)."
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player')
makedepends=('7zip')
source=("http://yumenikki.info/${_pkgname}${pkgver}chs.rar"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.sh")
md5sums=('b9a475e67f51cd1280d727e877bbd587'
		'SKIP'{,,})
noextract=( *.rar ) #unsupported rar by bsdtar
options=(!strip)
prepare() {
	7z x "${_pkgname}${pkgver}chs.rar"
}
package() {
	install -d "$pkgdir/opt"
	rm "梦日记/Yumenikki${pkgver}/RPG_RT.exe"
	mv "梦日记/Yumenikki${pkgver}/" "$pkgdir/opt/$pkgname"
	#What is the correct encoding for iconv?
	install -Dm644 "梦日记/请先阅读。${pkgver}.txt" "$pkgdir/opt/$pkgname/ReadMe.txt"
	install -Dm644 "梦日记/中文版补充说明.txt" "$pkgdir/opt/$pkgname/SupplementForChineseVer.txt"
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
