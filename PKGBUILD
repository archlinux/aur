# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kafka-python-ng'
pkgname='python-kafka-ng'
pkgver='2.2.3'
pkgrel='1'
pkgdesc='NG fork for Python client for Apache Kafka'
arch=('any')
url="https://github.com/wbarnha/$_projectname"
license=('Apache-2.0')
depends=('python>=3.8.0' 'python-botocore' 'python-crc32c' 'python-lz4' 'python-snappy' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d6fa4dab8d68515f28e9bb036c83e1178eae9a1d7f9fda4e4b93a213174ecc6cd27cb818cfa0dc06d1853fa4aed5971d5f76e6efa0cc4eed87ce1fc033c5fc21')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"

	# setuptools-scm normally needs a git repo, set an explicit version instead
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
