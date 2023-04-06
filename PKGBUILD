# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Adhityaa Chandrasekar <c.adhityaa@gmail.com>

pkgname=python-unidiff
# https://github.com/matiasb/python-unidiff/blob/master/HISTORY
pkgver=0.7.4
pkgrel=3
pkgdesc='Simple Python library to parse and interact with unified diff data'
arch=('any')
url="https://github.com/matiasb/python-unidiff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
# PyPI tarballs is missing tests https://github.com/matiasb/python-unidiff/pull/61 https://github.com/matiasb/python-unidiff/issues/99
source=("https://github.com/matiasb/python-unidiff/archive/v$pkgver/python-unidiff-$pkgver.zip")
sha256sums=('781868e760d2933facdd40b24f5733d4c6f9fa9ba3128dfecba3d2c94db48e0b')

build() {
  cd python-unidiff-$pkgver
  python setup.py build
}

check() {
  cd python-unidiff-$pkgver
  python -m unittest discover -s tests
}

package() {
  cd python-unidiff-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
