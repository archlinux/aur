# Maintainer: lmartinez-mirror
pkgname=fish-fzf-git
_pkgname=${pkgname%-git}
pkgver=6.2.r0.g20ec3e4
pkgrel=1
epoch=1
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
provides=("$_pkgname")
conflicts=("$_pkgname")
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

