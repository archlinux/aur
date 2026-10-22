# Maintainer: Stefan Gehr <stefan@gehr.xyz>

_pyname=krpc
pkgname=python-krpc
pkgver=0.7.0
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=('LGPL-3.0-only')
arch=('any')
depends=('python' 'python-protobuf')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/krpc-python-$pkgver.tar.gz")
b2sums=('3178b52adb31155c59a4952bc7a41c4df9aa31745d96aae1c3bb23c55f071c537ae3d312b2c9f1a3345a0d64a78b2fec8091af8bdfd36d3904c191e06805c5a7')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
