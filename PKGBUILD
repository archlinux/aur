# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=lettergen
pkgver=1.0.0
pkgrel=1
pkgdesc='Generate scrlttr2 letters like a pro!'
arch=(x86_64)
url='https://gitlab.com/repomaa/lettergen'
license=('GPL3')
depends=(gc libevent libyaml texlive-core texlive-latexextra)
makedepends=(crystal shards)

source=(
  "https://gitlab.com/repomaa/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  'https://gitlab.com/repomaa/lettergen/uploads/86c9f3c563d47650b2f526ae916a9bbb/lettergen-v1.0.0.tar.gz.sig'
)
sha256sums=(
  'cb700f0f35446e080eddf596f8190f471981cbd5f94240b44be5e95560640fca'
  '89edc0c8f2d8dff3221f0ec01578f5ebe970a2485459a492678d2783e3232a46'
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
