pkgname=erlang_ls
pkgver=0.48.0
pkgrel=2
pkgdesc='The Erlang Language Server'
arch=(x86_64)
url=https://erlang-ls.github.io/
license=(Apache)
depends=(erlang-nox)
makedepends=(rebar3)
source=(git+https://github.com/erlang-ls/erlang_ls.git#tag=$pkgver)
b2sums=('SKIP')

prepare() {
  cd $pkgname

  sed \
    -e "s/dialyzer_plt:from_file/dialyzer_cplt:from_file/g" \
    -e "s/dialyzer_plt:get_default/dialyzer_cplt:get_default_cplt_filename/g" \
    -i apps/els_lsp/src/els_typer.erl
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX="$pkgdir/usr" make install
}
