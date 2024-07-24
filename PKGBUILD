# Maintainer: VCalV

_gituser=p0n1
pkgname=epub_to_audiobook
pkgdesc="command-line tool to convert EPUB ebooks into audiobooks"
pkgver=0.6.1
pkgrel=1
#epoch=1
arch=("any")
url="https://github.com/$_gituser/$pkgname"
license=("MIT")
makedepends=()
depends=(
	ffmpeg
	python-beautifulsoup4
	python-ebooklib
	python-mutagen
	python-requests
	python-socksio
	python-pydub
	python
)
optdepends=(
	python-openai
	python-edge-tts
)
conflicts=("$pkgname-git")
provides=("$pkgname")

source=(
	"https://github.com/$_gituser/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	run.sh
)
sha512sums=(
	a8313f564c00134e2b843c1e192e42135cf83514bb5d20914cf482aad1cc1b45861cc055804548a3508ac465ad2c6efefeef6451784131acd642da317dc55509
	fb715e3fdc5c18d8c72d9493b345f1b1562528fb745767b9dcaf01bcebb1e5d4edde93b4da30c0078db3b57e859b40b67309763736545f9c0b0307fe778b8cba
)

package() {
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
	cd "$pkgname-$pkgver"
	local _dest="$pkgdir/opt/$pkgname/"
	install -d "$_dest"
	install main.py "$_dest"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	cp -r audiobook_generator "$_dest"
	find "$_dest" -type d -exec chmod 755 {} \;
}
