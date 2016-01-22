# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=1.11.1
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
depends=('perl-www-curl' 'perl-dbd-sqlite' 'gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
source=("http://nixos.org/releases/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('21a99b3d0afdbe10241aaf506738fd0a81ff868e3d7c666e3cb6b621a926ea7a')

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
