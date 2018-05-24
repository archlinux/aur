# Maintainer: Alastair Pharo <asppsa at gmail dot com>
# Contributor: Felix Morgner <felix.morgner@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix
pkgver=2.0.2
pkgrel=2
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64' 'armv7h')
url="https://nixos.org/nix"
license=('LGPL')
depends=('gc' 'libsodium')
makedepends=('bzip2' 'gc' 'openssl')
install=nix.install
source=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver.tar.xz")
sha256sums=('2d2984410f73d759485526e594ce41b9819fafa4676f4f85a93dbdd5352a1435')


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
