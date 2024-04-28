# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-xeddsa
pkgver=1.0.2
pkgrel=2
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
sha256sums=('b72b3265b7d69809aae8fcf063e0f2a72f1c600a47cc625813d5bda5a15b1731')
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
