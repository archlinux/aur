# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="doctoc"
pkgname="$_pkgname"
pkgver=2.6.4
pkgrel=1
pkgdesc="Generates table of contents for markdown files inside local git repository"
arch=('any')
url="https://github.com/technote-space/doctoc"
license=('GPL3')

depends=('nodejs')
makedepends=(
  'git'
  'npm'
)

conflicts=('doctoc-git')

options=(!emptydirs)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd "$_pkgsrc"

  mkdir -p "${pkgdir:?}/usr"
  npm pack .
  npm install --user root -g --prefix="${pkgdir:?}/usr" *.tgz

  find "${pkgdir:?}" -name "package.json" -exec sed -e "s|${pkgdir:?}||" -i {} \;
  find "${pkgdir:?}" -name "package.json" -exec sed -e "s|${srcdir:?}||" -i {} \;
}
