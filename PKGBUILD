# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
pkgname=${_pkgname}-zh-cn
pkgver=0.10
pkgrel=3
pkgdesc="Surrealistic adventure game about exploring the dreams (Simplified chinese)"
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player')
makedepends=('7zip')
source=("http://yumenikki.info/${_pkgname}${pkgver}chs.rar"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.sh")
sha256sums=('912af73da62b739a8ea4ebd0542ae46939e3ba61791f438dbe5ad1ef345ab24b'
            'b79c3a8125598b35d2a5baba5d44aba4973220e8415a86e9f88fe2aad21003c6'
            '39125abeef72301782c30322f1649a22354760a76017b37531fbb642af6ccf0b'
            '6b3262a56d9883bd10efcd34566b81077c81c45fcc97250b229f4ed02ba5501b')
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
