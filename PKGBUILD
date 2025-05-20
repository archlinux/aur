# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname=python-cantools
_gitname=cantools
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=40.2.2
pkgrel=1
arch=('any')
license=('MIT')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'python-setuptools-scm'
)
depends=(
	'python>=3.8'
	'python-bitstruct>=8.16.1'
	'python-can>=3.3.4'
	'python-textparser>=0.21.1'
	'python-diskcache'
	'python-argparse-addons'
	'python-crccheck'
	'python-matplotlib'
)
optdepends=(
	'mypy'
	'python-pipx'
	'python-ruff'
	'python-tox'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('d4916ed676662ce093c7787660e0fce6')

build() {
	cd "$srcdir/$_gitname-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
		python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_gitname-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
		python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
