# Maintainer: gilcu3
# Previous Maintainer: Ben Alex <ben.alex@acegi.com.au>

_pkgname=tflite-runtime
pkgname=python-$_pkgname
pkgver=2.14.0
pkgrel=3
pkgdesc='TensorFlow Lite Python bindings'
arch=('x86_64')
_py=cp311
url='https://www.tensorflow.org/lite/'
license=('Apache')
depends=('python-numpy')
makedepends=("python-pip")
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux2014_$arch.whl)
sha256sums=('195ab752e7e57329a68e54dd3dd5439fad888b9bff1be0f0dc042a3237a90e4d')

package() {
  pip install --isolated --upgrade --no-deps --ignore-installed --root=$pkgdir --no-warn-script-location --no-compile $_pkgname==$pkgver
  cd $pkgdir
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
  
}

