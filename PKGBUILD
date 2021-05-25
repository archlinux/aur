# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=norka
pkgver=0.7.2
pkgrel=1
pkgdesc='Note-taking software with Markdown support designed for Pantheon'
arch=('any')
url='https://tenderowl.com/work/norka/'
license=('MIT')
depends=('granite' 'gtksourceview3' 'gtkspell3' 'python-cairo' 'python-gobject' 'python-mistune2'
         'python-requests' 'webkit2gtk')
makedepends=('appstream-glib' 'meson')
source=("https://github.com/TenderOwl/Norka/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4184940d3f73d60ef7b2a8793d4b23f56aaf24500e37984385f3186068fe5f7a')

build() {
  arch-meson Norka-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Norka-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

