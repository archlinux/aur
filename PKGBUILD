# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on python-sphinx: Johannes Löthberg <johannes@kyriasis.com>, Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-2
pkgver=2.4.4
pkgrel=1
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
provides=(python-sphinx)
conflicts=(python-sphinx)
optdepends=('imagemagick: for ext.imgconverter'
            'texlive-latexextra: for generation of PDF documentation')
source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz"{,.asc})
sha256sums=('b4c750d546ab6d7e05bdff6ac24db8ae3e8b8253a3569b754e445110a0a12b66'
            'SKIP')
validpgpkeys=('8A11B79A5D0D749A66F0A030102C2C17498D6B9E'  # Takeshi KOMIYA
              'E9BEABB07E7B9CC3F56E62C91425F8CE5EBA0E07') # Takayuki Shimizukawa

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

# vim:set ts=2 sw=2 et:
