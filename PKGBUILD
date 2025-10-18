# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname="livebook"
pkgver=0.17.2
pkgrel=1
pkgdesc="Automate code & data workflows with interactive Elixir notebooks"
arch=('any')
url='https://livebook.dev'
_github_url="https://github.com/livebook-dev/livebook"
license=('Apache-2.0')
depends=('elixir>=1.18' 'erlang-parsetools' 'erlang-asn1' 'erlang-inets' 'erlang-os_mon' 'erlang-runtime_tools' 'erlang-ssl' 'erlang-xmerl')
makedepends=('elixir')
sha256sums=()

build() {
    mix local.hex --force --if-missing
    mix local.rebar --force --if-missing
    mix escript.install --force hex livebook "${pkgver}"
}

check() {
    "$HOME/.mix/escripts/livebook" --version
}

package() {
    local escript_dir="${HOME}/.mix/escripts"
    install -Dm755 "${escript_dir}/livebook" "${pkgdir}/usr/bin/livebook"}
}
