# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=exa
pkgver=0.7.0
pkgrel=1
pkgdesc='Replacement for ls written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/ogham/exa'
license=('MIT')
conflicts=("${pkgname}-git")
replace=("${pkgname}-git")
depends=('libssh2')
makedepends=('cmake' 'rust' 'cargo')
source=("${url}/archive/v${pkgver}.zip")
sha256sums=('0758a3b0ac4b959c755f60965cb9c137ddfc0b1bc032874ecdf5784c90fc4f71')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install exa binary and manpage 
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/target/release/${pkgname} \
    "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/contrib/man/${pkgname}.1 \
    "${pkgdir}"/usr/share/man/man1/${pkgname}.1

  # Install completions
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/contrib/completions.bash \
    "${pkgdir}"/usr/share/bash-completion/completions/${pkgname}
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/contrib/completions.zsh \
    "${pkgdir}"/usr/share/zsh/site-functions/_${pkgname}
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/contrib/completions.fish \
    "${pkgdir}"/usr/share/fish/completions/${pkgname}.fish
}  

# vim:set ft=sh ts=2 sw=2 et:
