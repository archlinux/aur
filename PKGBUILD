# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-xeddsa
pkgver=1.0.3
pkgrel=1
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('x86_64')
makedepends=(
	'git'
	'python-setuptools'
	'cmake'
	'libsodium'
	'python-pip'
	'python-build'
	'python-installer'
	'python-wheel'
)
source=("https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f4904d2275ae954d344fcaa6542fa0f4e50e0b3f9b65a3a68c2d87421af4e4d')
depends=(
	'glibc'
	'libxeddsa'
	'python-cffi'
	'python-libnacl'
	'python-pynacl'
)
provides=("${pkgname}")
conflicts=("${pkgname}")

prepare() {
	cd ${pkgname}-${pkgver}
	# Remove stale wheels
	rm -rf dist/
}

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
