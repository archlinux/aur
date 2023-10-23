# Maintainer:
# Contributor: Sebastian Reuße <seb@wirrsal.net>

_pkgname="git-fixup"
pkgname="$_pkgname-git"
pkgver=1.5.0.r12.gf964653
pkgrel=1
pkgdesc="Provide a likely candidate for git commit --fixup"
arch=(any)
url="https://github.com/keis/git-fixup"
license=('ISC')

depends=('git')
optdepends=(
  "zsh: to use git fixup tab completion"
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/keis/git-fixup"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"

  make PREFIX="${pkgdir:?}/usr" install
  make PREFIX="${pkgdir:?}/usr" install-zsh

  install -Dm644 README.md -t "${pkgdir:?}/usr/share/doc/$pkgname/"
  install -Dm644 COPYING.md "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"
}
