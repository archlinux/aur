# Maintainer: TexturedPolak <texturedpolak@gmail.com>
# Contributor: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=2.3.0
pkgrel=1
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('MIT')
depends=('python>=3.7.0-1')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core>=3.2.0-1')
checkdepends=('python-pytest')
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
sha256sums=('4cca50f734a6e3b2cc2aaf96c904a9476ca73cdfc0f203f7c7477fa77761ea60')
validpgpkeys=()

prepare(){
	# Make source dist from repo
	cd $_name-$pkgver
        python -m build --sdist --no-isolation
        tar -xzf dist/*.tar.gz
}

build(){
	# Build wheel
	cd $_name-$pkgver/$_name-$pkgver
	python -m build --wheel --no-isolation
}

check(){
	# Run tests
	cd $_name-$pkgver/$_name
	python -m pytest tests
}

package(){
	cd $_name-$pkgver/$_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
