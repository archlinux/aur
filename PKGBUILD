# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on python-sphinx: Johannes Löthberg <johannes@kyriasis.com>, Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-2
pkgver=2.4.5
pkgrel=3
pkgdesc='Python documentation generator'
arch=('any')
url=http://www.sphinx-doc.org/
license=('BSD')
depends=('python-babel'
         'python-docutils'
         'python-imagesize'
         'python-jinja'
         'python-pygments'
         'python-requests'
         'python-setuptools'
         'python-snowballstemmer'
         'python-sphinx-alabaster-theme'
         'python-sphinxcontrib-'{{apple,dev,html}help,jsmath,qthelp,serializinghtml})
#checkdepends=('imagemagick' 'librsvg'
#              'python-html5lib'
#              'python-pytest'
#              'texlive-fontsextra' 'texlive-latexextra')
conflicts=(python-sphinx)
optdepends=('imagemagick: for ext.imgconverter'
            'texlive-latexextra: for generation of PDF documentation')
source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz")
sha256sums=('b00394e90463e7482c4cf59e7db1c8604baeca1468abfc062904dedc1cea6fcc')

build() {
  cd Sphinx-$pkgver
  make build
}

# https://github.com/sphinx-doc/sphinx/issues/6777
#check() {
#  cd Sphinx-$pkgver
#  LC_ALL="en_US.UTF-8" make test
#  rm -r tests
#}

package() {
  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
