# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-xeddsa
pkgver=1.1.0
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
source=(
	"https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"pyproject.patch"
)
sha256sums=('045f2d65564b4cad4e9486cbff98d44ece4a73418925b204f29857d6bdeac0dd'
            'f163cb741585a12e60e7ec4cab564b352fb42f8911ffff1dbbabd5c034300d2c')
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
	patch pyproject.toml ../pyproject.patch
}

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
