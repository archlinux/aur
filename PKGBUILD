# Maintainer: lmartinez-mirror
pkgname=fish-fzf
pkgver=6.2
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.2' 'fzf')
optdepends=('fd: faster, friendlier alternative to find'
            'bat: smarter cat with syntax highlighting'
            'git')
makedepends=('git')
# checkdepends=('fish-fishtape')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a83f498e058c1b23f1e8a88dec0466085331dcb948d3cf1d25b99d8b05450e3621c8043c3c5815db111d57f178643fc88b3194dce1091c43613c2e8394643945')

prepare() {
  test -d "$pkgname-$pkgver" || mv "fzf.fish-$pkgver" "$pkgname-$pkgver"
}

# check() {
#   cd "fzf.fish-$pkgver/"
#   find tests -type f -exec fish -Pc 'fishtape {}' \;
# }

package() {
  cd "$pkgname-$pkgver/"
  install -Dm 644 conf.d/fzf.fish "$pkgdir/etc/fish/conf.d/fzf.fish"
  find functions -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
