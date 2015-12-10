# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-fixup-git
_gitname=git-fixup
pkgver=v1.0.2.r8.g94696df
pkgrel=1
pkgdesc="Provide a likely candidate for git commit --fixup."
arch=(any)
url="https://github.com/keis/git-fixup"
license=(custom)
depends=(git)
optdepends=("zsh: to use git fixup tab completion")
makedepends=(git)
provides=(git-fixup)
conflicts=(git-fixup)
source=(git+https://github.com/keis/git-fixup)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"

  make PREFIX="$pkgdir"/usr install
  make PREFIX="$pkgdir"/usr install-zsh

  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$_gitname"/README.md
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING.md
}
