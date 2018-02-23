# Maintainer: Felix Morgner <felix.morgner@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=2.0
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
depends=('gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
install=nix.install
source=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver.tar.xz")
sha256sums=('7024d327314bf92c1d3e6cccd944929828a44b24093954036bfb0115a92f5a14')


prepare() {
  cd "$pkgname-$pkgver"
}

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
