# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname=python-cantools
_gitname=cantools
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=39.4.6
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
license=('GPL3')
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
)
optdepends=(
	'python-matplotlib: plot decoded messages'
	'mypy'
	'python-pipx'
	'python-ruff'
	'python-tox'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('deda958b1cb10f57d808ee6fd60db681')

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
