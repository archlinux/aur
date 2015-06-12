# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>

pkgname=hubicfuse
pkgver=2.0.0
pkgrel=1
pkgdesc="A fuse filesystem to access HubiC cloud storage"
arch=('i686' 'x86_64')
conflicts=("hubicfuse-git")
provides=("hubicfuse")
url='https://github.com/TurboGit/hubicfuse'
license=('MIT')
depends=('fuse' 'libxml2' 'json-c')
makedepends=('gcc' 'libxml2' 'pkg-config' 'make')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3a587ce6821c20612bf1a40729133736908c712c3a6597c2965090cf7ac5c677')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make -j $(nproc)
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir/$pkgname-$pkgver/hubic_token" "$pkgdir/usr/bin/hubic_token"
  echo "##################################################################"
  echo "For setup, please refer to https://github.com/TurboGit/hubicfuse"
  echo "##################################################################"
}
# vim:set ts=2 sw=2 et:

