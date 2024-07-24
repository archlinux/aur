# Maintainer: VCalV

_pkgname=epub_to_audiobook
_gituser=p0n1
pkgname=epub_to_audiobook-git
pkgdesc="command-line tool to convert EPUB ebooks into audiobooks"
pkgver=r102.fdacb8e
pkgrel=1
#epoch=1
arch=("any")
url="https://github.com/$_gituser/$_pkgname"
license=("MIT")
makedepends=('git')
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
conflicts=("$_pkgname")
provides=("$_pkgname")

source=(
	"git+https://github.com/$_gituser/$_pkgname.git"
	run.sh
)
sha512sums=(
	'SKIP'
	fb715e3fdc5c18d8c72d9493b345f1b1562528fb745767b9dcaf01bcebb1e5d4edde93b4da30c0078db3b57e859b40b67309763736545f9c0b0307fe778b8cba
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 run.sh "$pkgdir/usr/bin/$_pkgname"
	cd "$_pkgname"
	local _dest="$pkgdir/opt/$_pkgname/"
	install -d "$_dest"
	install main.py "$_dest"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	cp -r audiobook_generator "$_dest"
	find "$_dest" -type d -exec chmod 755 {} \;
}
