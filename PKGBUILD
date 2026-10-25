# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=python-mcap-protobuf-support
pkgver=0.6.0
pkgrel=1
pkgdesc='Protobuf support for the Python MCAP library'
arch=('any')
url='https://github.com/foxglove/mcap'
license=('MIT')
depends=('python' 'python-mcap' 'python-protobuf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
_tag="releases/python/mcap-protobuf-support/v$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
b2sums=('3a5231091b699c5f1d27168a89da5e47b2590a79972728b4a869e3bcbd8868f7c0a8686e6c0cec4e7e62ea3f21cdce15d1adfdd0acc3d7dcb3167064bc07fdca')
_srcroot="mcap-releases-python-mcap-protobuf-support-v$pkgver"

build() {
	cd "$_srcroot/python/mcap-protobuf-support"
	# TODO: upstream setuptools warning, cosmetic. "License classifiers are
	# deprecated": newer setuptools (PEP 639) wants an SPDX license expression in
	# setup.cfg instead of the "License :: OSI Approved :: MIT License" classifier.
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcroot/python/mcap-protobuf-support"
	python -m pytest tests
}

package() {
	cd "$_srcroot"
	python -m installer --destdir="$pkgdir" python/mcap-protobuf-support/dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
