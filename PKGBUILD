# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=pincer
pkgname=python-$_pkgname-git
pkgver=latest
pkgrel=3
pkgdesc="The snappy asynchronous discord api wrapper API wrapper written with aiohttp."
arch=(any)
url="https://github.com/Pincer-org/Pincer" # https://pincer.dev/ (under construction)
license=('MIT')
depends=('python>=3.8' 'python-aiohttp')
optdepends=('python-pillow: image support'
            'python-orjson: speed'
            'python-brotli: speed'
            'python-aiodns: speed'
            'python-cchardet: speed')
makedepends=('git' 'python-poetry' 'python-build' 'python-installer')
source=("${_pkgname}::git+https://github.com/Pincer-org/Pincer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
