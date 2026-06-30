# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Eric Cheng <ericcheng@hey.com>
# Contributor: Filippo Roggi <zzkw35@gmail.com>
# Contributor: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>

pkgname=amdgpu-fan
pkgdesc="Python daemon for controlling the fans on AMDGPU cards"
epoch=1
_rev=4dda773eb8aba10f853a8706a9009bda434b56e9
pkgver=0.0.24.r2.${_rev:0:10}
pkgrel=1
arch=(any)
license=(GPL-2.0-or-later)
depends=(python python-numpy python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
url=https://github.com/chestm007/amdgpu-fan
source=(${url}/archive/${_rev}.tar.gz)
sha256sums=('961316cb3e19dd76b68d34379eb558cf332b9677a8d27630570c950d2c84d52e')

build() {
	cd amdgpu-fan-${_rev}

	python -m build --wheel --no-isolation
}

package() {
	cd amdgpu-fan-${_rev}

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 amdgpu-fan.service
}
