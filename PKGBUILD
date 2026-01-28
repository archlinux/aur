# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=nyarchassistant
pkgver=1.2.5
pkgrel=1
pkgdesc="Nyarch Assistant (Newelle Fork)"
arch=("any")
url="https://github.com/NyarchLinux/NyarchAssistant"
license=('GPL')
depends=(
  "python-edge-tts"
  "python-requests"
  "python-requests-toolbelt"
  "python-expandvars"
  "python-beautifulsoup4"
  "python-gobject"
	"python-livepng"
	"python-lxml-html-clean"
  "python-lxml"
  "python-hatch-fancy-pypi-readme"
  "python-hatchling"
	"python-newspaper"
	"python-openai"
	"python-pillow"
	"python-pyaudio"
	"python-pylatexenc"
  "python-tiktoken"
  "python-matplotlib"
  "python-markdownify"
  "python-mcp"
  "gtksourceview5"
	"vte4"
	"webkitgtk-6.0"
  "python-gtts"
  "python-model2vec"
)

optdepends=(
	"python-ollama: Ollama support"
	"ollama: Ollama auto serve"
	"python-google-generativeai: Google Gemini support"
  "python-speechrecognition: Speech recognition support"
)

makedepends=("meson")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('58520adbae748a214a03feff3cb44878768b0c5547690e70245ce06a6ea7f37b')

build() {
    cd "NyarchAssistant-$pkgver" || return

	if [ -d build ]; then
		rm -rf build
	fi
	arch-meson . build
	meson compile -C build
}

check() {
    cd "NyarchAssistant-$pkgver" || return
	meson test -C build --print-errorlogs || :
}

package() {
    cd "NyarchAssistant-$pkgver" || return

	meson install -C build --destdir "$pkgdir"
	chmod +x "$pkgdir/usr/bin/nyarchassistant"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
