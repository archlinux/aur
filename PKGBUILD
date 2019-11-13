# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsd-truedeps
pkgver=0.16.0
pkgrel=1
pkgdesc='Modern ls with a lot of pretty colors and awesome icons'
url='https://github.com/Peltoche/lsd'
arch=('x86_64')
license=('Apache')
depends=('gcc-libs')
optdepends=('awesome-terminal-fonts: partial glyph support'
            'ttf-nerd-fonts-symbols: complete glyph support')
conflicts=("${_pkgname}=${pkgver}")
provides=("${_pkgname}=${pkgver}")
makedepends=('rust' 'cargo')
source=(https://github.com/Peltoche/lsd/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('e2406748d78431a1c03bdd2404a204a006c19905d926e41a36587b93a791e003')
sha512sums=('562c070d3e716af26ff3a54632cd176a1b95471fbb7e947f8175f89df483ff5b337d1a0d7578fa6ee41f77fa7ed1a618d37e91ebf1b8428e6a857918b415aa39')

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --locked
}

check() {
  cd ${_pkgname}-${pkgver}
  cargo test --release --locked
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
