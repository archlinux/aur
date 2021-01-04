# Maintainer: Michael Duell <dev at akurei dot me>

pkgname=monocypher-git
_pkgname=monocypher
provides=('monocypher')
conflicts=('monocypher')
pkgver=3.1.2.r0.gbaca5d3
pkgrel=1
pkgdesc="Monocypher is an easy to use crypto library inspired by libsodium and TweetNaCl"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://monocypher.org/"
license=('custom:BSD')
depends=('glibc')
source=("monocypher::git+https://github.com/LoupVaillant/Monocypher.git")
sha512sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}



package() {
  cd "$_pkgname"
  install -d -m 755 "$pkgdir/usr/include/$_pkgname"
  install -m 644 src/monocypher.c "$pkgdir/usr/include/$_pkgname/monocypher.c"
  install -m 644 src/monocypher.h "$pkgdir/usr/include/$_pkgname/monocypher.h"
  install -m 644 src/optional/monocypher-ed25519.c "$pkgdir/usr/include/$_pkgname/monocypher-ed25519.c"
  install -m 644 src/optional/monocypher-ed25519.h "$pkgdir/usr/include/$_pkgname/monocypher-ed25519.h"
  install -d -m 755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -m 644 LICENCE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -d -m 755 "$pkgdir/usr/share/man/man3"
  install -m 644 doc/man/man3/*.3monocypher "$pkgdir/usr/share/man/man3/"
  install -d -m 755 "$pkgdir/usr/share/man/man3/advanced"
  install -m 644 doc/man/man3/advanced/*.3monocypher "$pkgdir/usr/share/man/man3/advanced/"
  install -d -m 755 "$pkgdir/usr/share/man/man3/optional"
  install -m 644 doc/man/man3/optional/*.3monocypher "$pkgdir/usr/share/man/man3/optional/"
}
