# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Brad Ackerman <brad[at]facefault[dot]org>

pkgname=python-msoffcrypto-tool
_pkg="msoffcrypto_tool"
pkgver=6.0.0
pkgrel=1
pkgdesc='A Python tool and library for decrypting encrypted MS Office files'
arch=('any')
url='https://github.com/nolze/msoffcrypto-tool'
license=('MIT')
depends=(python-olefile python-cryptography)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9a5ebc4c0096b42e5d7ebc2350afdc92dc511061e935ca188468094fdd032bbe')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel
}

package() {
	cd "$_pkg-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
