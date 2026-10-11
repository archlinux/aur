# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=elvis
pkgname=erlang-elvis
pkgver=6.0.0
pkgrel=1
pkgdesc="Erlang Style Reviewer"
arch=('any')
url="https://github.com/inaka/elvis"
license=('Apache-2.0')
depends=('erlang') # XXX: list specific packages?
makedepends=('rebar3')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inaka/elvis/archive/${pkgver}.tar.gz")
sha256sums=('ea0d3438062d94b686b375e98995584ed7b6b8863582f77b1966971299e400f4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rebar3 escriptize
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm0755 "_build/default/bin/elvis" "${pkgdir}/usr/bin/elvis"
  install -Dm0644 "priv/zsh_completion/_elvis" "${pkgdir}/usr/share/zsh/site-functions/_elvis"
  install -Dm0644 "priv/bash_completion/elvis" "${pkgdir}/usr/share/bash-completion/completions/elvis"
}
