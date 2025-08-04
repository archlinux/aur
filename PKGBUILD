# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: marmis <tiagodepalves@gmail.com>

pkgname=shellcheck-bin-doc
pkgdesc='Man pages for shellcheck-bin'
pkgver=0.11.0
pkgrel=1
url='https://shellcheck.net'
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('pandoc')
# this is a hard requirement, otherwise we would need to declare a conflict with
# extra/shellcheck, which would then block 'shellcheck-bin'
depends=('shellcheck-bin')
provides=('shellcheck-doc')
conflicts=('shellcheck-doc')
replaces=('shellcheck-doc')
source=("https://raw.githubusercontent.com/koalaman/shellcheck/v${pkgver}/shellcheck.1.md"
        "https://raw.githubusercontent.com/koalaman/shellcheck/v${pkgver}/manpage")
b2sums=('90364c01d86f82c8dc8e967c28187aba0e65f2885ffac66adc0fe1e509f9ec49e0845bc07868c013898c1d2c0399cbda3873ad94a91add0e7cdaaee2b14962e3'
        'b52b528495a4be379cdfe226a3a1118e26f5faf71651464854d28ca1aee981a594e729acf9243f9de5574fa388778e4b180297f70349043453447f9fab383d70')

prepare() {
  chmod +x "${srcdir}/manpage"
}

build() {
  cd "${srcdir}"

  ./manpage
}

package() {
  install -D -m644 "${srcdir}/shellcheck.1" -t "${pkgdir}/usr/share/man/man1"
}
