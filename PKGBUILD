# Maintainer: Nelson Estevão <nelsonmestevao@proton.me>

pkgname="livebook"
pkgver="0.9.2"
pkgrel="1"
pkgdesc="Automate code & data workflows with interactive Elixir notebooks"
arch=("x86_64")
url="https://livebook.dev"
license=("Apache-2.0")
conflicts=("$pkgname")
provides=("$pkgname")
depends=("elixir")
makedepends=("elixir")

build() {
    mix local.hex --force
    mix local.rebar --force
    mix escript.install hex livebook "$pkgver"
}

check() {
    "$pkgdir/usr/bin/livebook" --version
}

package() {
    # Copy the installed package to the package directory
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$HOME/.mix/escripts/livebook" "$pkgdir/usr/bin"
}
