# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=1.11.2
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
depends=('perl-www-curl' 'perl-dbd-sqlite' 'gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
source=("http://nixos.org/releases/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('fc1233814ebb385a2a991c1fb88c97b344267281e173fea7d9acd3f9caf969d6')

build () {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --libexecdir="/usr/lib/$pkgname" \
              --sysconfdir=/etc \
              --enable-gc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
