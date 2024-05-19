# Maintainer: Skythrew <mael.guerin@murena.io>

pkgname=eartag
pkgver=0.6.1
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/World/eartag"
license=('MIT')
depends=('libadwaita' 'chromaprint' 'python-gobject' 'python-pyacoustid' 'python-pillow' 'python-mutagen' 'python-magic' 'python-requests')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('56382b7be54fd452d089c6ea754e726b99422d6cca0b3db256cfe2335fdd6aac42e15cc3fcad9752b82bac76fcda4ff2b1d020f0251d015c5a109f0e7026cb88')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
