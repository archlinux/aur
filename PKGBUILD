# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=argon2
pkgver=20161029
pkgrel=2
pkgdesc="A password-hashing function (reference C implementation)"
arch=("x86_64" "i686")
url="https://github.com/P-H-C/phc-winner-argon2"
license=('Apache')
depends=("glibc")
source=("https://github.com/P-H-C/phc-winner-argon2/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "libargon2.pc")
sha256sums=('fe0049728b946b58b94cc6db89b34e2d050c62325d16316a534d2bedd78cd5e7'
            '4189ce6c183319ceaf2c4ec96facd424deeaa9e2819efb7511893bcf3ef5c836')

prepare() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"
  cp "${srcdir}/libargon2.pc" libargon2.pc
  sed -i -e "s/@UPSTREAM_VER@/${pkgver}/" libargon2.pc
}

build() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"
  make argon2 libs
}

check() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  chmod -x "${pkgdir}/usr/include/argon2.h"
  install -Dm644 libargon2.pc "${pkgdir}/usr/lib/pkgconfig/libargon2.pc"
}

# vim:set ts=2 sw=2 et:
