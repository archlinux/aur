# Contributor: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: Bink

pkgname=bibleanalyzer
pkgver=5.6.5
pkgrel=3
pkgdesc="A free Bible study solution with exciting premium features."
arch=("any")
url="https://www.bibleanalyzer.com"
license=('LicenseRef-bibleanalyzer')
depends=(
	"bash"
	"python"
	"espeak"
	"python-wxpython"
	"python-mutagen"
	"python-lxml"
	"python-configobj"
	"python-pillow"
	"python-espeak"
	"webkit2gtk-4.1"
	"xsel"
)
source=(
	"${url}/${pkgname}_${pkgver}_all.deb"
	"${url}/BA-Fonts.zip"
)
noextract=("BA-Fonts.zip")
sha256sums=(
	'b29be6abf0b0e24bfb48cbfd50b7b9e98fbdc5445ee0419c5f09f7f7da8f7502'
	'd03c866f5c70e837499e5a2731661140622199493551518d7c8e9f174a3ea42e'
)
b2sums=(
	'eb7a777cb523c0e685021ab5324aa2ffdd9605dc2c92f3c9a4d4cdc780c73fc2ec4b8c5156298bc5fea793a57dc306f7558b8439b4ab9768fff121a64e999ffb'
	'fc409b3c1ff8b36d70bb7c7c0ef3783fc9d30d5255a33787583d1174a795fdc5d06d214385271c0533cefdc7b4df9aedf02975521688b7a68c1115eb15144ad3'
)
install="${pkgname}.install"

package() {
	tar -xf data.tar.zst -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Shims for the Debian multiarch paths the bundled components probe for
	mkdir -p "$pkgdir/usr/lib/x86_64-linux-gnu"
	ln -s "/usr/share/espeak-data" "$pkgdir/usr/lib/x86_64-linux-gnu/espeak-data"
	ln -s "/usr/lib/webkit2gtk-4.1" "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"

	# Fonts for Hebrew, Greek, and Old English resource display
	install -d "$pkgdir/usr/share/fonts/bibleanalyzer"
	bsdtar -xf "$srcdir/BA-Fonts.zip" -C "$pkgdir/usr/share/fonts/bibleanalyzer"
}
