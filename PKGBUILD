# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: winlu <derwinlu@gmail.com>

pkgname=rebar3-git
pkgver=5385.4594b00f
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('Apache-2.0')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
makedepends=('git')
source=("git+https://github.com/erlang/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  HOME="." ./bootstrap
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm0755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm0644 "apps/rebar/priv/shell-completion/bash/rebar3" "${pkgdir}/usr/share/bash-completion/completions/rebar3"
}
