# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=doctoc
pkgver=2.6.4
pkgrel=1
pkgdesc="Generates table of contents for markdown files inside local git repository, installed through npm"
arch=('any')
url="https://github.com/technote-space/doctoc"
license=('GPL3')

depends=('nodejs')
makedepends=(
  'git'
  'npm'
)

provides=('doctoc')
conflicts=(
  ${provides[@]}
  'doctoc-git'
)
options=(!emptydirs)

source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr"
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz

  find "$pkgdir" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "$pkgdir" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}
