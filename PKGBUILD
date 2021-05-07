# Maintainer: lmartinez-mirror
pkgname=fish-fzf
pkgver=6.3
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.2' 'fzf>=0.25')
optdepends=('fd>=7.5.0: faster, friendlier alternative to find'
            'bat>=0.16.0: smarter cat with syntax highlighting'
            'git')
makedepends=('git')
# checkdepends=('fish-fishtape')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3e80cc7690a10762c8d6b6e77f4643b2a33cdcb1685690566f3bf28da8bdd618d61eadf24eb8e0cc368fbcf8092fd37e981c3c60c35fd2d7d422c459e05671bb')

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
