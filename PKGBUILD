# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Eric Cheng <ericcheng@hey.com>
# Contributor: Filippo Roggi <zzkw35@gmail.com>
# Contributor: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>

pkgname=amdgpu-fan
pkgdesc="Python daemon for controlling the fans on AMDGPU cards"
pkgver=0.1.0
pkgrel=4
arch=(any)
license=(GPL2)
depends=(python python-numpy python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
url="https://github.com/zzkW35/amdgpu-fan"
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('f2c1546aede4559d99f870531b317d0c2726013ae9dbf2ec4298f1e92c9684a4')

prepare() {
	cd ${pkgname}-${pkgver}

	sed -i "s/PROJECTVERSION/${pkgver}/g" setup.py
}

build() {
	cd ${pkgname}-${pkgver}

	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m 0644 amdgpu-fan.service
}
