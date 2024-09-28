# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=usb_monitor
pkgname=python-${_pkgname}
pkgver=1.21
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/b6/f1/479d812dedea109b7cefb8b4e65b57a97564b51df0f9ec0edb700186f1b6/${_pkgname}-${pkgver}.tar.gz")
b2sums=("45109a2abb946a97e81e968f11e31edebcd914337302882789f93e06bdee3dacb76daf1f1d597cb0d2375f80b8de0969e599d7fe7208375ea2429dd01342ce91")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
