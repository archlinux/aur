# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=elvis
pkgname=erlang-elvis
pkgver=4.1.1
pkgrel=1
pkgdesc="Erlang Style Reviewer"
arch=('any')
url="https://github.com/inaka/elvis"
license=('Apache-2.0')
depends=('erlang') # XXX: list specific packages?
makedepends=('rebar3')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inaka/elvis/archive/${pkgver}.tar.gz")
sha256sums=('82a42102734285d0e39a8b55bc2195752f44347b6f2ef0962834e49579d067c8')

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
