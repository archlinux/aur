# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=1.0.2
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-beautifulsoup4'
         'python-curl-cffi' 'python-expandvars' 'python-gobject' 'python-gtts'
         'python-lxml' 'python-lxml-html-clean' 'python-matplotlib' 'python-newspaper'
         'python-numpy' 'python-openai' 'python-pillow' 'python-pyaudio' 'python-pydub'
         'python-pygame' 'python-pylatexenc' 'python-requests' 'python-speechrecognition'
         'python-tiktoken' 'python-tldextract' 'vte4' 'webkitgtk-6.0' 'python-markdownify')
optdepends=('python-gpt4all')
makedepends=('meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('144673bfbff16c6da13df127a476ee3f6f89460a24be21ce2537d149f530cd17')

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
