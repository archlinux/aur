# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=tau-enigma
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple text editor written using libhelium"
arch=('x86_64' 'aarch64')
depends=('libhelium')
makedepends=(
  'gtk4'
  'glib2'
  'libgee'
  'gobject-introspection'
  'dart-sass'
  'vala'
  'meson'
  'ninja'
)
url="https://github.com/tau-OS/enigma"
license=('GPL-3.0')

source=("https://github.com/tau-OS/enigma/archive/refs/tags/v$pkgver.zip")
sha256sums=('44b7fe18e8291499e3809c1bd6013574e3c2d15df4d3d820f3e89bcbebd0ee83')

prepare() {
  cd "$srcdir/enigma-$pkgver"
  meson subprojects download
}

build() {
  cd "$srcdir/enigma-$pkgver"

  ls

  arch-meson . builddir
  meson compile -C builddir
}

package() {
  cd "$srcdir/enigma-$pkgver"

  meson install -C builddir --destdir "$pkgdir"
}
