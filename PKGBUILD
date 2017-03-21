# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=1.11.8
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
depends=('perl-www-curl' 'perl-dbd-sqlite' 'gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
source=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver.tar.xz")
sha256sums=('69e0f398affec2a14c47b46fec712906429c85312d5483be43e4c34da4f63f67')

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
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
