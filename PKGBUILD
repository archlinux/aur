# Maintainer : Frederik Wegner <wegnerfrederik at gmail dot com>
_name="cpprb"
pkgname=python-cpprb
pkgver=v9.4.5
pkgrel=1
pkgdesc="ReplayBuffer for Reinforcement Learning written by C++ and Cython"
arch=('any')
url="https://ymd_h.gitlab.io/cpprb/"
license=('MIT')
depends=('python>=3.5' 'python-numpy')
optdepends=(
	'python-matplotlib: needed for gym'
	'python-pyvirtualdisplay: needed for gym'
	'python-sphinx: needed for api'
	'python-sphinx-rtd-theme: needed for api'
	'python-sphinx-automodapi: needed for api'
	)
provides=("python-$_name")
conflicts=("python-$_name")
makedepends=(
	'python-setuptools'
	'cython>=0.29'
	)
source=("https://gitlab.com/ymd_h/$_name/-/archive/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
	git ls-remote --tags --sort='v:refname' https://gitlab.com/ymd_h/cpprb \
	| tail --lines=1 \
	| cut --delimiter='/' --fields=3
}

package() {
	cd ${srcdir}/$_name-$pkgver
	install -D -m644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
