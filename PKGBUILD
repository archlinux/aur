# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>
pkgname=elixir-ls
pkgver=0.3.1
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
arch=('any')
url='https://github.com/elixir-lsp/elixir-ls'
depends=('elixir>=1.7.0' 'erlang-nox>=20.0')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
sha256sums=('56a72d5bd41c6676cd34a7595dfab46328098f8c7979114a3d75cc7237458d1a')

build() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod
  mix deps.get
  mix compile
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/lib/elixir-ls
  MIX_ENV=prod mix elixir_ls.release -o "${pkgdir}"/usr/lib/elixir-ls

  install -dm0755 "${pkgdir}"/usr/bin
  ln -sf /usr/lib/elixir-ls/language_server.sh "${pkgdir}"/usr/bin/elixir-ls
  ln -sf /usr/lib/elixir-ls/debugger.sh "${pkgdir}"/usr/bin/elixir-ls-debugger
}
