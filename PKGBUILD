# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='libcanlock'
pkgver=3.3.0
pkgrel=2
pkgdesc='A standalone RFC 8315 Netnews Cancel-Lock implementation for Unix'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://micha.freeshell.org/libcanlock/'
license=('custom')
depends=(
  'glibc'
)
provides=(
  'canlock'
  'libcanlock'
)
conflicts=(
  'canlock'
  'libcanlock'
)
source=(
  "https://micha.freeshell.org/libcanlock/src/${pkgname}-${pkgver}.tar.bz2"
)
options=('lto')

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  ./configure \
    --prefix=/usr \
    --enable-legacy-api \
    --enable-pc-files

  make
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  make DESTDIR="$pkgdir/" install

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README  "$pkgdir/usr/share/doc/$pkgname/README"
}

sha256sums=(
  'a709f59d6611031c293b483cfa0be6c37d6c68220cc94aee44e4a9eabf76988d'
)
sha512sums=(
  '100d2b4bf3eadedb7da230317cd37b2c1b259bbd783099a74e0d75fdc6ecddb8a6fd854a2b272bda3629bcf1ac1ae2b3d5657fca9137c17e38aad88f30e4c81c'
)
b2sums=(
  '001512a6d2d226aed93882de8d8f4f02a066cc67e6f21b411b8e1ee2ff0d4580732c90a6fc2756a79f992629cd18fbc319510960c39f33284c86bebfed3d4216'
)

# eof
