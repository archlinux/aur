# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=usb_monitor
pkgname=python-${_pkgname}
pkgver=1.23
pkgrel=1
pkgdesc="USBMonitor is an easy-to-use cross-platform library for USB device monitoring."
arch=(x86_64 aarch64)
url='https://github.com/Eric-Canas/USBMonitor'
license=(MIT)
depends=(
	python-pyudev
)
makedepends=(
	python-pip
	python-wheel
	python-setuptools
    python-build
    python-installer
)
source=("https://files.pythonhosted.org/packages/04/0d/c800cd6eb3a62996780334472bcfffe478dde28e4feeb6be8d15937c3e61/${_pkgname}-${pkgver}.tar.gz")
b2sums=("16f81f93ec8e3e21d5cfb05b3d98553c640a61176ab2e7777004606234c62cdf8a52cf7dafcc7a26e74b4019464ffe9097acedac1231870be86929fe05b235bf")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
