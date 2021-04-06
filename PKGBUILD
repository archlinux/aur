# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer <dev@fedux.org>

pkgname=svg2tikz-git
pkgver=r216.7a9959c
pkgrel=1
pkgdesc="set of tools for converting SVG graphics to TikZ/PGF code"
arch=('any')
url="https://github.com/kjellmf/svg2tikz"
license=('GPL')
depends=('python-lxml')
makedepends=('git')
provides=('inkscape-tikz')
conflicts=('inkscape-tikz')
replaces=('inkscape-tikz-hg')
optdepends=('inkscape: for using the inksape extension files')
source=("git+https://github.com/kjellmf/svg2tikz")
md5sums=('SKIP')
_gitname="svg2tikz"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/"$_gitname"
  [[ -d build ]] || rm -rf build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  _inkscape_ext="$pkgdir/usr/share/inkscape/extensions"
  install -d "$_inkscape_ext"
  cp ./svg2tikz/extensions/tikz_export* "$_inkscape_ext"
}
