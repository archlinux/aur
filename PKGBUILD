# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jyantis <yantis@yantis.net>

_pkgname=textblob
pkgname=python-textblob-git
pkgver=0.15.3.r8.ge6cd979
pkgrel=1
pkgdesc='library for processing textual data and provides an API for diving into commmon natural language processing (NLP)'
arch=('any')
url='https://github.com/sloria/textblob'
license=('MIT')
depends=('python' 'python-nltk' 'nltk-data')
makedepends=('git' 'python-setuptools')
optdepends=('python-textblob-aptagger-git: A fast and accurte part-of-speech tagger for TextBlob')
provides=('python-textblob')
conflicts=('python-textblob')
source=('git+https://github.com/sloria/textblob.git')
sha256sums=('SKIP')


pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
