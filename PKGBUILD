# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver=1.8.1
pkgrel=1
pkgdesc="The application framework for tauOS apps."
arch=('x86_64' 'aarch64')
depends=('gtk4' 'glib2' 'libgee')
makedepends=(
  'dart-sass'
  'git'
  'glib2'
  'gobject-introspection'
  'gtk4'
  'libgee'
  'meson'
  'ninja'
  'vala'
)
url="https://github.com/tau-OS/libhelium"
license=('LGPL-3.0')

source=("https://github.com/tau-OS/libhelium/archive/refs/tags/$pkgver.zip")
sha256sums=('d1073973df7830ed838b7b62208a9d705284ea317adb06bbebf73c1b3368c56f')

prepare() {
  cd "$srcdir/libhelium-$pkgver"
  meson subprojects download
}

build() {
  cd "$srcdir/libhelium-$pkgver"

  ls

  arch-meson . builddir -Dvaladoc=false
  meson compile -C builddir
}

package() {
  cd "$srcdir/libhelium-$pkgver"

  meson install -C builddir --destdir "$pkgdir"
}
