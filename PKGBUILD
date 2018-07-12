# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=articlemetaapi
pkgname=('python-scielo-articlemeta')
pkgver=1.26.2
pkgrel=1
pkgdesc="SciELO's ArticleMeta API Client"
arch=('any')
url='https://github.com/scieloorg/articlemetaapi'
license=('BSD')
makedepends=('python-pip')
depends=('python-thriftpy' 'python-requests' 'python-scielo-xylose')
options=(!emptydirs)
sha256sums=('41d98f7a8952cd177e2d0964cd3f01d34856a9406c22564323f7e917c17e4144'
            'ef8dfe393d6b68b332d3425d4a9301e0c24fd0c250f88a6a527fa800ccb7fd6e')
_pypi='https://files.pythonhosted.org/packages'
_path='32/28/83b688a641d18081473299a4efbb40cb7d2837c6d7a7a959cfad8adedef1'
_fname="$_name-$pkgver-py2.py3-none-any.whl"
_chash=dd457354261a7d716e34a36cc2eee000a21d4aad
source=("$_pypi/$_path/$_fname"
  "https://raw.githubusercontent.com/scieloorg/articlemetaapi/$_chash/LICENSE")

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="$pkgdir/" \
    --ignore-installed \
    --no-deps \
    "$_fname"
  rm -rf "$pkgdir/usr/lib/python3.6/site-packages/tests"
  find "$pkgdir" -name '*.pyc' -delete
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$pkgdir"
  python -Om compileall .
}
