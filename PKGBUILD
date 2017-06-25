# Maintainer: Brian <brian@bamonroe.com>
# Author: ftilmann at github.com
# https://github.com/ftilmann/latexdiff/issues/104
pkgname=latexdiff-git
pkgver=1.2.1.r0.g32ef94d
pkgrel=2
pkgdesc="Compares two latex files and marks up significant differences between them. Git version."
arch=(any)
url="https://github.com/ftilmann/latexdiff/"
license=('GPL3')
depends=('texlive-core' 'perl' 'perl-algorithm-diff')
makedepends=('git')
source=('git+https://github.com/ftilmann/latexdiff/')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/latexdiff"
  _tag=$(git tag --sort=v:refname | tail -n1)
  printf '%s.r%s.g%s' "${_tag#}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "${srcdir}/latexdiff"
  mkdir -p "$pkgdir/usr/bin"
  cp latexdiff "$pkgdir/usr/bin/latexdiff-git"
}

