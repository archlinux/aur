# Maintainer: Harriet O'Brien <harrietobrien at protonmail dot com>
# Contributor: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=1.9.37
pkgrel=1

_denodomver="0.1.41-alpha-artifacts"
_quarto="quarto"

pkgdesc="Quarto is an open-source scientific and technical publishing system built on Pandoc"
arch=('x86_64')
url="https://quarto.org/"
license=('MIT')

depends=(
  "nodejs"
  "deno"
  "dart-sass"
  "esbuild"
  "pandoc"
  "lua-lpeg"
  "typst"
)

makedepends=(
  "git"
  "npm"
  "rust"
)

provides=("quarto")
conflicts=(
  "quarto-cli-bin"
  "quarto-cli-pre-release"
  "quarto-cli-bin-pre-release"
  "quarto-cli-git"
)

options=(!strip)

source=(
  "https://github.com/quarto-dev/${pkgname}/releases/download/v${pkgver}/${_quarto}-${pkgver}-linux-amd64.tar.gz"
  "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
)

sha256sums=(
  "78fcd90e983e3e7dbe3f0d1921cc10253c1eca7b92c20dd4bc2a3c1bca0a9af5"
  "5ab1a73e73b9edf9d2c81e655658d970e6212497a5368d8f0bc8613bbdf8d91d"
)

package() {
  cd "$srcdir/quarto-${pkgver}"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a . "$pkgdir/usr/lib/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$pkgname/bin/quarto" "$pkgdir/usr/bin/quarto"
}

