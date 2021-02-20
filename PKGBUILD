# Maintainer: lmartinez-mirror
pkgname=fish-fzf-git
_pkgname=${pkgname%-git}
pkgver=5.6.r3.g2aaf2dd
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.1.2' 'fzf' 'fd' 'bat')
makedepends=('git')
# checkdepends=('fish-fishtape')
provides=('fish-fzf')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

# check() {
#   cd "$_pkgname/tests/"
#   fish -Pc "fishtape extract_var_info_test.fish"
#   fish -Pc "fishtape search_shell_variables.fish"
# }

package() {
  cd "$_pkgname"
  install -Dm 644 conf.d/fzf.fish "$pkgdir/etc/fish/conf.d/fzf.fish"
  find functions -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

