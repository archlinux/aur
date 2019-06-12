# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsd-truedeps
pkgver=0.15.1
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
sha256sums=('849ad168171737ef1ca74b762b3d9fb885c936cb9a753eca07426886478ad2de')
sha512sums=('58a280615e72f9dc685e49532d147c17d94be099f80400add15b983d5945d98004a6a636f7f7a76809376dc07cab25f44d716a4b00456db0201c34f935952ed3')

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
