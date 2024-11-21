# Maintainer: a821 at (nospam) mail de
# Contributor: LinArcX <Linarcx at gmail . com>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-pytvmaze
pkgver=2.0.8
pkgrel=6
pkgdesc="Python interface to the TV Maze API"
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytvmaze/pytvmaze-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/srob650/pytvmaze/master/LICENSE.txt"
        "fix_aka_class.patch")
sha512sums=('9d628942255adf9d0183554e02a3d58e0ac392507578f62c7bf534eafc7a75064c20e23db55b697c0d1beedd6f23361e55ba13561dc05e1a6cdc7e4433c80a48'
            'e85246930999668fa1d14d290fb9d0eae05a3c702f448983d9d1578b6b6c9c5537d4be004a4db3d5d5d3578858070feaebbc14bedce71caaeb6acd02dac0c42b'
            'd46391ad855b934ac5cdfb45a355e9a1fafc69b14fd3b5ba5638428ed6c2fbb6425bb198a7fe0def0fb7c1f92e252c13c7877648e3f797ea17770409d254e93c')

prepare() {
  cd "pytvmaze-$pkgver"
  patch -p1 < ../fix_aka_class.patch
  sed -i 's/description-file/description_file/; 4,6d' setup.cfg
}

build() {
  cd "pytvmaze-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "pytvmaze-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
