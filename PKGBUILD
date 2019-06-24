# Maintainer: Ian Luites <ian@luites.com>
# Previous maintainer and contributors of the `elixir` pkg:
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir-git
pkgver=1.9.0
pkgrel=1
pkgdesc="a functional meta-programming aware language built on top of the Erlang VM"
elixirver="1.9.0"
url="http://elixir-lang.org"
arch=('any')
license=('Apache' 'custom:EPL')
depends=('erlang-nox')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elixir-lang/elixir/archive/v$elixirver.tar.gz")
sha256sums=('dbf4cb66634e22d60fe4aa162946c992257f700c7db123212e7e29d1c0b0c487')

build() {
  cd elixir-"$elixirver"
  make
}

check() {
  cd elixir-"$elixirver"
  make test_erlang
}

package() {
  provides=(elixir)
  conflicts=(elixir)

  cd elixir-"$elixirver"
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

