# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Maik93 <michael.mugnai@gmail.com>
# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname=python-cantools
_name=${pkgname#python-}
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=43.0.2
pkgrel=1
arch=('any')
license=('MIT')
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
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'python-setuptools-scm'
)
optdepends=(
	'mypy'
	'python-pipx'
	'python-ruff'
	'python-tox'
)

source=("git+$url.git#tag=$pkgver")
sha256sums=('8add361dca350f9326cade1a018d56702c28866bb164a4f0f76a9b42744596a5')

build() {
	cd "$srcdir/${_name}"
	SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
		python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name}"
	SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
		python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
