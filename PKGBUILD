# Maintainer: lmartinez-mirror
pkgname=vim-gitignore-git
_pkgname=${pkgname%-git}
pkgver=r165.48416f0
pkgrel=2
pkgdesc="gitignore syntax and plugin for vim"
arch=('any')
url="https://github.com/shaggyrogers/vim-gitignore"
license=('Apache')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("$_pkgname")
source=("git+$url"
        "LICENSE")
sha512sums=(
  'SKIP'
  'b99e9d9d73b3dae775a25fa94625da3f60a013a29926bf3a23285642cbd49e14f06a54d683a84046031c0e7e930a269e8329741d3f4d1772f64c0de685ea4179')

pkgver() {
  cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find ftdetect ftplugin indent neosnippets pythonx snippets syntax UltiSnips \
    -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

