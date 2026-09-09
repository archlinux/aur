# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=1.5.0
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=(dconf gdk-pixbuf2 glib2 gtk4 gtksourceview5 hicolor-icon-theme libadwaita libsoup3 pango
         portaudio python python-beautifulsoup4 python-expandvars python-gobject python-gtts
         python-httpx python-lxml python-lxml-html-clean python-markdownify
         python-matplotlib python-mcp python-newspaper python-numpy
         python-openai python-pillow python-pyaudio python-pydantic
         python-pydub python-pylatexenc python-pysilero-vad
         python-requests python-tiktoken python-tldextract
         python-webrtcvad-wheels vte4 webkitgtk-6.0)
optdepends=(faiss-cpu python-docx2txt python-llama-index-core python-model2vec python-speechrecognition)
# optdepends=(python-llama-index-readers-file python-llama-index-retrievers-bm25 python-llama-index-vector-stores-faiss python-llama-server)
makedepends=('meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('760073a6ffdc5ee0561a3416ae406ae1b7892fb9926576f1913c6c3b5c4420ad')

build() {
  arch-meson Newelle-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  cd Newelle-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
