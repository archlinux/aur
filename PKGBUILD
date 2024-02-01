# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

pkgname=libhelium
pkgver=1.8.9
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
sha256sums=('8ec5fa64f64b77524993b959d6309798f35fa8326bbad5ec28a59f15b562e532')

prepare() {
  cd "$srcdir/libhelium-$pkgver"

  meson subprojects download
}

build() {
  cd "$srcdir/libhelium-$pkgver"

  arch-meson . builddir -Dvaladoc=false -Ddemo=false
  meson compile -C builddir
}

package() {
  cd "$srcdir/libhelium-$pkgver"

  meson install -C builddir --destdir "$pkgdir"
}
