# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=1.0.1
pkgrel=2
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
sha256sums=('fcf48743e1f2bb69277dce4a9327e134175e2cdc2eae889aeb6127348077d17d')

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
