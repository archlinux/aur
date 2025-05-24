# Maintainer: VCalV

_gituser=p0n1
pkgname=epub_to_audiobook
pkgdesc="command-line tool to convert EPUB ebooks into audiobooks"
pkgver=0.8.0
pkgrel=2
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
)
conflicts=("$pkgname-git")
provides=("$pkgname")

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/$_gituser/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	run.sh
	run_ui.sh
)
sha512sums=('3205139d393b258676c7a3833e9a1f37c45e78368d5234482981e90451d99a6a41cccf779d82a3991bcff361450de634509ad1a603e9616d719c96862be8dc19'
            'fb715e3fdc5c18d8c72d9493b345f1b1562528fb745767b9dcaf01bcebb1e5d4edde93b4da30c0078db3b57e859b40b67309763736545f9c0b0307fe778b8cba'
            '855d5b20cbaf1dc4e42ad46670df40eb372f4dc61d36e8c2d86c41b103819cbb8ad652cd7115e08fb1b4b29fd899a3cf13985d3fc4fd7893537eb016938004d4'
)

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
