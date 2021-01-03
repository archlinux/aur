# Maintainer: Thomas Heinemann <thomas@niphba.de>

pkgname=python-mailsuite
pkgver=1.6.1
_commit=a26ecb232826330037f814846bd2da46df0aaae8 # Untagged release + changelog fix
pkgrel=1
pkgdesc='Python package to make receiving, parsing, and sending email easier'
arch=(any)
url=https://seanthegeek.github.io/mailsuite/
license=(Apache)
depends=('mailparser>=3.14.0'
		 'python-imapclient>=2.1.0'
         'python-dnspython>=2.0.0'
         'python-html2text>=2020.1.16'
         python-nose
         python-pygments
         flake8
         python-doc8
         python-collective-checkdocs
         python-jinja
         python-packaging
         python-imagesize
         python-sphinx-alabaster-theme
         python-babel
         'rstcheck>=3.3.1'
         python-sphinx
         python-sphinx_rtd_theme
         python-wheel
         python-codecov)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/seanthegeek/mailsuite/archive/$_commit.tar.gz)
sha512sums=('623d9402b12077ec5fb75a62758f3dce5e87119bd7dadcab9083f568fe35fbfd7929f40c724dc1d71fae33ea68497abb44b953570038874aeda44213b17ab827')

build() {
  cd mailsuite-$_commit
  python setup.py build

  cd docs
  make man
}

package() {
  cd mailsuite-$_commit
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/mailsuite.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
