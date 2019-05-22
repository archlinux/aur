# Maintainer: Ian Luites <ian@luites.com>
# Previous maintainer and contributors of the `elixir` pkg:
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir-git
pkgver=1.8.2
pkgrel=1
pkgdesc="a functional meta-programming aware language built on top of the Erlang VM"
url="http://elixir-lang.org"
arch=('any')
license=('Apache' 'custom:EPL')
depends=('erlang-nox')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elixir-lang/elixir/archive/v$pkgver.tar.gz")
sha256sums=('cf9bf0b2d92bc4671431e3fe1d1b0a0e5125f1a942cc4fdf7914b74f04efb835')

build() {
  cd elixir-"$pkgver"
  make
}

check() {
  cd elixir-"$pkgver"
  make test_erlang
}

package() {
  provides=(elixir)
  conflicts=(elixir)

  cd elixir-"$pkgver"
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

