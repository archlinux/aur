# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Maintainer: max-k <max-k AT post DOT com>

pkgname=hubicfuse
pkgver=3.0.0
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
sha256sums=('27fa97d3320446facec4a7c387be7f12190a2852190b1de796a7c05f679790b3')

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

