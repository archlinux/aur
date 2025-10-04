# Maintainer: VCalV

_gituser=p0n1
pkgname=epub_to_audiobook
pkgdesc="command-line tool to convert EPUB ebooks into audiobooks"
pkgver=0.8.5
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
sha512sums=('40c20e07e111071f741561ebf340a10097121a24906ce00e50fbb19d41c478be96acecb9cdf3205ebaaa40d6b2f6c9851d1dc497592588c668578c471bf099c3'
            '67074d441f2da7aa347650f47ac4730da1851587ddd18e1f65c6a2ba1e280251980bc663c7c38fb58a26fd5dcde085e313be0d5bec1344ca3ae0bfdc0ec22752'
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
