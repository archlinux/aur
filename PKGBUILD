# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=python38-pygments
pkgver=2.13.0
pkgrel=1
pkgdesc="Python 3.8 syntax highlighter"
arch=('any')
url="https://pygments.org/"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools' 'python38-sphinx' 'python38-wcag-contrast-ratio')
checkdepends=('python38-pytest' 'python38-lxml')
provides=('py38gmentize')
conflicts=('py38gmentize')
replaces=('pyg38mentize')
source=(https://pypi.org/packages/source/P/Pygments/Pygments-$pkgver.tar.gz)
sha256sums=('56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1')

build() {
  cd Pygments-$pkgver
  make -C doc html
}

check() {
  cd Pygments-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd Pygments-$pkgver

  python3.8 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  mkdir -p "$pkgdir/usr/share/doc"
  cp -rT doc/_build/html "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 doc/pygmentize.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 external/pygments.bashcomp \
    "$pkgdir/usr/share/bash-completion/completions/pygmentize"
  mv "$pkgdir/usr/bin/pygmentize" "$pkgdir/usr/bin/pyg38mentize"
}

# vim:set ts=2 sw=2 et:
