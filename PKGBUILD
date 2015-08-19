# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=acrylamid
pkgver=0.7.10
pkgrel=5
pkgdesc="Static blog compiler with incremental updates"
arch=('any')
depends=('python-jinja' 'python-markdown' 'python-unidecode')
makedepends=('python-setuptools')
optdepends=('discount: Discount'
            'python-asciimathml: AsciiMathML to MathML'
            'python-ansi2html: ANSI escape codes in HTML code examples'
            'python-docutils: reStructuredText'
            'python-magic: Non-ASCII text detection'
            'python-mako: Mako Templating'
            'python-pygments: Syntax Highlighting'
            'python-smartypants: Typography enhancements'
            'python-textile: Textile'
            'python-twitter: Twitter'
            'python-yaml: YAML parser')
url="http://posativ.org/acrylamid/"
license=('BSD')
options=(!emptydirs)
source=("acrylamid-${pkgver}.tar.gz::https://codeload.github.com/posativ/acrylamid/tar.gz/${pkgver}")
md5sums=('1feb45145984e5732c39dbe1a71f47ad')
provides=('python-acrylamid')
conflicts=('python-acrylamid')

prepare() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Fixing Jinja version...'
  sed -i 's#Jinja2==2.6#Jinja2>=2.6#g' setup.py dev-requirements.txt test-requirements.txt
}

build() {
  cd $srcdir/${pkgname#python-}-$pkgver

  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd $srcdir/${pkgname#python-}-$pkgver

  LANG=en_US.UTF-8 python setup.py install --root="$pkgdir" --optimize=1
}
