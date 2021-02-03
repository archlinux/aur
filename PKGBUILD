# Maintainer: Cullen Ross <cullenrss@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: stef204 <stef204@yandex.com>

pkgname=ptask
pkgver=1.0.0
pkgrel=2
_taskver=2.5.3
pkgdesc='GTK+ task managing application'
arch=('x86_64')
url='https://wpitchoune.net/ptask'
license=('GPL2')
depends=('gtk3' 'json-c' "task=$_taskver")
makedepends=('addinclude')
optdepends=('asciidoc: for generating the HTML version of NEWS and README'
            'help2man: for regenerate manpages automatically')
source=("https://wpitchoune.net/ptask/files/$pkgname-$pkgver.tar.gz")
sha256sums=('b8cde0f7994bd91410a13284188c865e255621bcfd23f6051f7b25b14eced18e')

prepare() {
  cd "$pkgname-$pkgver/src"

  echo -e '#pragma once\n#define is_error(ptr) (ptr == NULL)' > is_error.h
  addinclude tw.c is_error
  sed -i "s,2.0.0,$_taskver," tw.c
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/usr/share
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim: et ts=2 sw=2:
