# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=libtcd
pkgver=2.2.7.r3
_semver="${pkgver%.r*}"
pkgrel=1
pkgdesc="Provides a software API for reading and writing Tide Constituent Database (TCD) files"
arch=('x86_64')
url="https://flaterco.com/xtide/libtcd.html"
license=('custom')
depends=('glibc')
provides=("$pkgname.so")
source=("$pkgname-$pkgver.tar.xz::https://flaterco.com/files/xtide/$pkgname-${pkgver/.r/-r}.tar.xz")
sha256sums=('e1dde9aafb771eab57c676a99b4b79d61c6800990a0e72782bc20057a8a2d877')

build() {
  cd "$pkgname-$_semver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$_semver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
