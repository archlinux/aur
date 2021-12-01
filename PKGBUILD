# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-typepy
pkgver=1.3.0
pkgrel=1
pkgdesc='Variable runtime type checker/validator/converter'
arch=('any')
url='https://github.com/thombashi/typepy'
license=('MIT')
depends=('python-mbstrdecoder')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
optdepends=('python-dateutil' 'python-pytz')
checkdepends=('python-pytest-runner' 'python-tcolorpy' 'python-dateutil' 'python-pytz')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
# source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/typepy/typepy-$pkgver.tar.gz"
#         "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/typepy/typepy-$pkgver.tar.gz.asc")
# sha256sums=('96788530614083164993d1443959f6c58e6bb8e2da839812ddf462c203e4b84c'
#             'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367') ## Tsuyoshi Thombashi

build() {
  cd "$pkgname"
  python setup.py build
  cd docs
  PYTHONPATH=../ make man
}

check() {
  cd "$pkgname"
  python setup.py pytest
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/_build/man/typepy.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
