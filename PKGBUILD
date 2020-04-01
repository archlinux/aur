# Maintainer: piernov <piernov@piernov.org>

pkgname=python-tensorflow-graphics-git
pkgver=r265.e397941
pkgrel=1
pkgdesc="Differentiable Graphics Layers for TensorFlow "
url="https://github.com/tensorflow/graphics"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-tensorflow-addons-cuda-git' 'python-matplotlib')
makedepends=('python-setuptools')
optdepends=('openexr: EXR loader')
source=("git+https://github.com/tensorflow/graphics.git")
sha256sums=('SKIP')

pkgver() {
	cd graphics
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd graphics
	python setup.py sdist bdist_wheel
}

package() {
	cd graphics
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/tensorflow_graphics*.whl
}
