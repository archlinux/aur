# Maintainer: Bruno Unna <bruno dot unna at gmail dot com>
pkgname='euclidean-rhythms'
pkgver='0.1.2'
pkgrel='1'
pkgdesc="An implementation of the Euclidean rhythms idea in the form of an LV2 plugin"
arch=('x86_64')
url="https://github.com/bruno-unna/euclidean-rhythms"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
makedepends=('lv2>=1.18.10' 'meson>=1.0.0' 'ninja>=1.11.1')
optdepends=('ardour: to have a host for the plugin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bruno-unna/euclidean-rhythms/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1eafbf15c7ebba5389f0bd4ef3d7695c18e6b2cab6e67778215413ca2baa7eb8')

prepare() {
  arch-meson $pkgname-$pkgver build # --prefix=/usr --libdir=/usr/lib
}

build() {
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
