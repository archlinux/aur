# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver=1.8.5
pkgrel=2
pkgdesc="The application framework for tauOS apps."
arch=('x86_64' 'aarch64')
depends=('gtk4' 'glib2' 'libgee')
makedepends=(
  'dart-sass'
  'git'
  'gobject-introspection'
  'meson'
  'ninja'
  'vala'
)
url="https://github.com/tau-OS/libhelium"
license=('LGPL3')

source=("$pkgname-$pkgver.tar.gz::https://github.com/tau-OS/libhelium/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('db53346490a8cca673f124d14e4fabe978153e575878a9e31c83b299c08b8b81')

prepare() {
  cd "$srcdir/libhelium-$pkgver"

  meson subprojects download
}

build() {
  cd "$srcdir/libhelium-$pkgver"

  arch-meson . builddir -Dvaladoc=false
  meson compile -C builddir
}

package() {
  cd "$srcdir/libhelium-$pkgver"

  meson install -C builddir --destdir "$pkgdir"
}
