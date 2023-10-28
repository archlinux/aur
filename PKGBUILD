# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver=1.7.2
pkgrel=2
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
sha256sums=('4c1066675cbe0bd63694b07858be579c452f1db59499a24a52af94025390cb73')

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
