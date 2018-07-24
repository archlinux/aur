# Maintainer: Benoit Brummer <trougnouf at gmail dot com>
pkgname='python-keras-vis'
_name='keras-vis'
pkgver=0.4.1
pkgrel=3
pkgdesc='Neural Network visualization toolkit for keras'
url='https://github.com/raghakot/keras-vis'
depends=('python' 'python-keras')
makedepends=('python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/keras_vis-${pkgver}-py2.py3-none-any.whl")
md5sums=('3fc0331828127faa6b77019d2f48e9f8')

package() {
	cd "${srcdir}"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/"
	_pyver="$(python -c "import sys; print('%i.%i' % sys.version_info[:2])")"
	cd "${pkgdir}/usr/lib/python${_pyver}/site-packages/docs/"
	rm "__init__.py" __pycache__/__init__.*
}
