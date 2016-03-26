# Maintainer: Christian Howe <cjhowe7@gmail.com>

pkgname=elixirscript
pkgver=0.16.0
pkgrel=2
pkgdesc='Converts Elixir to Javascript'
arch=('any')
url='https://github.com/bryanjos/elixirscript'
license=('MIT')
depends=('erlang-nox')
makedepends=('elixir' 'npm')
source=("https://github.com/bryanjos/elixirscript/archive/v$pkgver.tar.gz")
md5sums=('55f0e1e962b5405f6651fb3cc3765095')

build() {
  cd "$pkgname-$pkgver"

  MIX_ENV=prod mix deps.get
  npm install

  MIX_ENV=prod mix compile
  MIX_ENV=prod mix dist
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 'elixirscript' "$pkgdir/usr/lib/elixirscript/bin/elixirscript"
  install -Dm644 '_build/prod/lib/elixir_script/priv/Elixir.js' \
    "$pkgdir/usr/lib/elixirscript/Elixir.js"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/bin"

  cd "$pkgdir/usr/bin"
  ln -s "../lib/elixirscript/bin/elixirscript" elixirscript
}

# Local Variables:
# mode: sh
# End:
