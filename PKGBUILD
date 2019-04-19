# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-cupy
_pkgname=cupy
pkgver=6.0.0rc1
pkgrel=1
pkgdesc="NumPy-like API accelerated with CUDA"
_github="cupy/cupy"
url="https://cupy.chainer.org"
arch=('x86_64')
license=('MIT')
depends=('cuda' 'cudnn' 'nccl' 'python-numpy' 'python-six' 'python-fastrlock')
makedepends=('python' 'python-setuptools')
source=("https://github.com/cupy/cupy/archive/v$pkgver.tar.gz"
"https://github.com/cupy/cupy/pull/2147.patch")
md5sums=('ca025663603d288eb3083f53f83743ac'
         'e501ec0f605c9d5214a8b733c66dd135')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 < "$srcdir/2147.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
