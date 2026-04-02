# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-fzf-git
_pkgname=${pkgname%-git}
pkgver=11.0.r0.g0069dbb
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish' 'fzf')
optdepends=(
    'fd: search directory'
    'bat: search directory & file preview'
    'git: search git log & status')
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
  install -Dvm644 completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dvm644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
  install -Dvm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
  install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

