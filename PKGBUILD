# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=1.2.5
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=(dconf gdk-pixbuf2 glib2 gtk4 gtksourceview5 hicolor-icon-theme libadwaita libsoup
         libsoup3 pango portaudio python python-beautifulsoup4 python-expandvars python-gobject
         python-gtts python-lxml python-lxml-html-clean python-markdownify python-matplotlib python-mcp
         python-newspaper python-numpy python-openai python-pillow python-pyaudio python-pydub python-pylatexenc
         python-requests python-tiktoken python-tldextract vte4 webkitgtk-6.0)
optdepends=(faiss-cpu python-docx2txt python-llama-index-core python-model2vec python-speechrecognition)
#optdepends=(python-llama-index-readers-file python-llama-index-retrievers-bm25 python-llama-index-vector-stores-faiss python-llama-server)
makedepends=('meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0e8114a8e469830638c198f9df030d1da327374be82e054fe0251c3cead72d11')

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
