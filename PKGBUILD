# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-zcash-params
pkgver=1
pkgrel=1
pkgdesc='Unofficial package providing Zcash params used by the Octez software suite'
url=https://gitlab.com/tezos/tezos
license=('MIT')
arch=('x86_64')
source=(
  "fetch-params.sh::https://raw.githubusercontent.com/zcash/zcash/713fc761dd9cf4c9087c37b078bdeab98697bad2/zcutil/fetch-params.sh"
)
sha512sums=(
  '3b4a424a9fcef3cd9448b8f036c52bda7482d6237deefc681803bc0fa0512101304361b03393bfdeb9922b22c92892f9aaa7a1b5bb41ff3cf55b4c44ea4ca78b'
)

build() {
  cd "$srcdir"
  HOME="$(pwd)" bash fetch-params.sh
  mv .zcash-params zcash-params
}

package() {
  cd "$srcdir"
  install -Dm 644 zcash-params/README $pkgdir/usr/share/zcash-params/README
  install -Dm 644 zcash-params/sapling-output.params $pkgdir/usr/share/zcash-params/sapling-output.params
  install -Dm 644 zcash-params/sapling-spend.params $pkgdir/usr/share/zcash-params/sapling-spend.params
  install -Dm 644 zcash-params/sprout-groth16.params $pkgdir/usr/share/zcash-params/sprout-groth16.params
}
