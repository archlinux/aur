# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# There is no Arch Linux package for Tensorflow Lite and therefore this package
# delegates to the full python-tensorflow. The reason for needing this package
# at all is to accommodate packages requiring Tensorflow Lite (eg PyCoral).

pkgname=python-tflite-runtime
pkgver=2.5.0.post1
pkgrel=2
pkgdesc='TensorFlow Lite Python bindings'
arch=('any')
url='https://www.tensorflow.org/lite/'
license=('Apache')
depends=('python-tensorflow')
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --upgrade --target="tflite_runtime" https://github.com/hjonnala/snippets/raw/main/wheels/python3.10/tflite_runtime-2.5.0.post1-cp310-cp310-linux_x86_64.whl
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/tflite_runtime/* $pkgdir/"$sitepackages"
}
