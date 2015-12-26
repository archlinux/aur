# Maintainer: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor : Yamashita Ren
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libbpg
pkgver=0.9.6
pkgrel=2
pkgdesc='BPG Image Encoder and Decoder'
arch=('x86_64' 'i686')
url='http://bellard.org/bpg/'
license=('BSD' 'LGPL')
depends=('libpng' 'libjpeg-turbo' 'sdl_image' 'yasm')
source=("$url$pkgname-$pkgver.tar.gz")
options=('staticlibs')

prepare() {
  sed -i 's/$(CMAKE_OPTS)/$(CMAKE_OPTS) -DENABLE_LIBNUMA=OFF/' "$pkgname-$pkgver/Makefile"
  sed -i 's/^CFLAGS+=-I.$/CFLAGS+=-I. -fPIC/' "$pkgname-$pkgver/Makefile"
}

build() {
  make USE_JCTVC=Y -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bpgdec "$pkgdir/usr/bin/bpgdec"
  install -Dm755 bpgenc "$pkgdir/usr/bin/bpgenc"
  install -Dm755 bpgview "$pkgdir/usr/bin/bpgview"
  install -Dm644 libbpg.a "$pkgdir/usr/lib/libbpg.a"
  install -Dm644 libbpg.h "$pkgdir/usr/include/libbpg.h"
  install -Dm644 bpgenc.h "$pkgdir/usr/include/bpgenc.h"
}

# vim:set ts=2 sw=2 et:

md5sums=('5f2aefff34342df327196019314d785b')
