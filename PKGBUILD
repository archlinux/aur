# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-sphinxcontrib-blockdiag
pkgver=3.0.0
pkgrel=2
pkgdesc='A sphinx extension for embedding block diagram using blockdiag'
arch=(any)
url='https://github.com/blockdiag/sphinxcontrib-blockdiag'
license=(BSD)
depends=(python blockdiag python-sphinx)
makedepends=(python-setuptools)
# otf-ipafont is used by test_latex
# python-nose will not be needed after https://github.com/blockdiag/sphinxcontrib-blockdiag/pull/25
#checkdepends=(python-nose python-sphinx-testing python-reportlab otf-ipafont)
# TODO: check https://github.com/blockdiag/sphinxcontrib-blockdiag/pull/25/files
optdepends=(
  'python-reportlab: for using PDF as the format of images'
)
source=("https://github.com/blockdiag/sphinxcontrib-blockdiag/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        ipafont-path.diff
        use-unittest-mock.diff)
sha256sums=('9061847004d900b458c2d611b4b539b2a3d594648060a222959f49c837cb41dc'
            'cd127f6f66d49d91d1b8716b5361d917c354e8eed6b6817e037d2c2441b7e9e8'
            '63d132b35ebb7702c2d8d638787bd54c3a12506a634d9181f008d4c66d3bb938')

prepare() {
  cd sphinxcontrib-blockdiag-$pkgver
  patch -Np1 -i ../ipafont-path.diff
  patch -Np1 -i ../use-unittest-mock.diff
}

build() {
  cd sphinxcontrib-blockdiag-$pkgver
  python setup.py build
}

#check() {
#  cd sphinxcontrib-blockdiag-$pkgver
#  # Running tests with 'nosetests' fails with issues around namespace packages
#  python -m nose -v
#}

package() {
  cd sphinxcontrib-blockdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
