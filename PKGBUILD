# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=lettergen
pkgver=1.1.0
pkgrel=1
pkgdesc='Generate scrlttr2 letters like a pro!'
arch=(x86_64)
url='https://gitlab.com/repomaa/lettergen'
license=('GPL3')
depends=(gc libevent libyaml texlive-core texlive-latexextra)
makedepends=(crystal shards)

source=(
  "https://gitlab.com/repomaa/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  'https://gitlab.com/repomaa/lettergen/uploads/b78a85d6c6c937a237ec752587d12c56/lettergen-v1.1.0.tar.gz.sig'
)
sha256sums=(
  '031b11a7dcd8749b2d84f46d16eba47488b49c1e0b14e70826e9541cfe178181'
  '93e5c658d1c76ee1bcb0ac5b8c2ecbf6dd343eaadbe70fda43592cd267670a29'
)

validpgpkeys=(
  'F0AF1CE34733B22317A8937D05557F53CD3C6458'
)

prepare() {
  cd "$pkgname-v${pkgver}"
  shards install --production
}

build() {
  cd "$pkgname-v${pkgver}"
  make
}

check() {
  cd "$pkgname-v${pkgver}"
  bin/lettergen examples/letter.yml
}

package() {
  cd "$pkgname-v${pkgver}"
  make install "PREFIX=$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
