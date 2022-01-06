# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=2.1
pkgrel=2
pkgdesc="A Linux application to handle audio tags (Gtk3)"
arch=('x86_64')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('gtk3' 'python-mutagen' 'python-cairo' 'python-musicbrainzngs'
         'python-pylyrics' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'https://github.com/lachhebo/GabTag/pull/20.patch')
sha256sums=('396add7d55f1296e7561495a404bad02b528b2169e1030d0e2edd6ec245b0214'
            '8f1f5f31edc10dac0571aa759e5d0872d616bd2136c3b0c9bbc89db945664834')

prepare() {
  cd "GabTag-$pkgver"

  # Fix Gtk version definition
  patch -Np1 -i $srcdir/20.patch
}

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
