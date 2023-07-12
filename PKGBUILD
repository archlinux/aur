# Maintainer: a821
# Contributor: Felix Yan
# Contributor:  jyantis <yantis@yantis.net>

pkgname=python-colorama-git
pkgver=0.4.6.r5.g21c4b94
pkgrel=1
epoch=1
pkgdesc='Simple cross-plaform colored terminal text in Python 3'
arch=('any')
url='https://github.com/tartley/colorama'
license=('BSD')
depends=('python')
source=("git+${url}")
sha256sums=('SKIP')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('python-colorama')
conflicts=('python-colorama')

pkgver() {
  cd colorama
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd colorama
  python -m build -nw
}

check() {
  cd colorama
  python -m unittest discover -p *_test.py
}

package() {
  cd colorama
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
