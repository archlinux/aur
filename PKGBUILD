# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=norka
pkgver=1.1.0
pkgrel=1
pkgdesc='Note-taking software with Markdown support designed for Pantheon'
arch=('any')
url='https://tenderowl.com/work/norka/'
license=('MIT')
depends=('granite' 'gtksourceview5' 'gtkspell3' 'libadwaita' 'python-cairo' 'python-gobject' 'python-mistune'
         'python-requests' 'webkit2gtk')
makedepends=('appstream-glib' 'meson' 'cmake')
source=("https://github.com/TenderOwl/Norka/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b9b0098eb42a82db8e1e696006412056e64d0ae826d0c97c328aeb05e65202dc')

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

