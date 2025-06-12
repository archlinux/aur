# Maintainer: VCalV

_gituser=p0n1
pkgname=epub_to_audiobook
pkgdesc="command-line tool to convert EPUB ebooks into audiobooks"
pkgver=0.8.2
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
	'python-openai: generate audio using OpenAI TTS'
	'python-edge-tts: generate audio using Microsoft edge TTS'
	'piper-tts: generate audio uding piper TSS'
	'python-gradio: web gui'
	'python-gradio_log: web gui'
	'python-sentencex: web gui'
)
conflicts=("$pkgname-git")
provides=("$pkgname")

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/$_gituser/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	run.sh
	run_ui.sh
)
sha512sums=('d5b92fa222b2c95c37c48a4cb46c351475c8746fc783deb8d19d7d9c8da613a2333b9554501722e239c2debf79f9977158faed30fe5da43fcf595497a161cacb'
            'fb715e3fdc5c18d8c72d9493b345f1b1562528fb745767b9dcaf01bcebb1e5d4edde93b4da30c0078db3b57e859b40b67309763736545f9c0b0307fe778b8cba'
            'e65affd982fc1de2d6603b8680dc09e91e7b63f10955db8c2ab22abb88cd205dee3fbf4e7542ad55ced1627fa7ff40d8a4b0bb0146432bf81e8b393ed3496013')

package() {
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 run_ui.sh "$pkgdir/usr/bin/$pkgname"_ui
	cd "$pkgname-$pkgver"
	local _dest="$pkgdir/opt/$pkgname/"
	install -d "$_dest"
	install main.py "$_dest"
	install main_ui.py "$_dest"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	cp -r audiobook_generator "$_dest"
	find "$_dest" -type d -exec chmod 755 {} \;
}
