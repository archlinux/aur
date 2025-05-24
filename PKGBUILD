# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=0.9.7
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-expandvars' 'python-gobject' 'python-gpt4all'
         'python-gtts' 'python-pyaudio' 'python-pygame' 'python-requests' 'python-speechrecognition'
         'python-matplotlib' 'python-numpy' 'python-pillow' 'python-pylatexenc')
makedepends=('git' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5ed44cc1dbe7991836cb76cf85e5368805511adf45782e4972c827252a2d25c6')

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
