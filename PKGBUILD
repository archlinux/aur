# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=1.11.6
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
depends=('perl-www-curl' 'perl-dbd-sqlite' 'gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
source=("https://nixos.org/releases/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('e729d55a9276756108a56bc1cbe2e182ee2e4be2b59b1c77d5f0e3edd879b2a3')

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
