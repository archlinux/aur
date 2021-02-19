# Maintainer: lmartinez-mirror
pkgname=vim-dockerfile-git
_pkgname=${pkgname%-git}
pkgver=r133.2386923
pkgrel=1
pkgdesc="Vim syntax file & snippets for Docker's Dockerfile"
arch=('any')
url="https://github.com/ekalinin/Dockerfile.vim"
license=('MIT')
depends=('vim-plugin-runtime')
groups=('vim-plugins')
makedepends=('git')
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  find ftdetect ftplugin indent snippets syntax -type f \
    -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

