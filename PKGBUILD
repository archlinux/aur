# Maintainer: Bruno Unna <bruno dot unna at gmail dot com>
pkgname='euclidean-rhythms'
pkgver='1.0.0'
pkgrel='1'
pkgdesc="An implementation of the Euclidean rhythms idea in the form of an LV2 plugin"
arch=('x86_64')
url="https://github.com/bruno-unna/euclidean-rhythms"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
makedepends=('lv2>=1.18.10' 'meson>=1.4.0' 'ninja>=1.11.1')
optdepends=('ardour: to have a host for the plugin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bruno-unna/euclidean-rhythms/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c741c8c59c440deef9ae044df1004692ef35a19562ba2ee5eefd47bd4d477c3a')

prepare() {
  git -C euclidean-rhythms-1.0.0 submodule update --init --recursive
}

build() {
  make -C $srcdir/euclidean-rhythms-1.0.0/src/BWidgets bwidgets
  arch-meson $pkgname-$pkgver build # --prefix=/usr --libdir=/usr/lib
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
