# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Igor Saric <karabaja4 at gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

pkgname=python-gpiozero
pkgver=2.0.1.post2
pkgrel=1
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=(any)
url="https://github.com/gpiozero/gpiozero"
license=(BSD-3-Clause)
depends=(python python-colorzero)
optdepends=(
    'python-spidev: for SPI access'
    'python-rpi-gpio: for pin access via raspberry-gpio-python library'
)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('f4972125f2b591544fe1eb64a8b89ef29f8520db070b0880fd9a8b31c7160089')
validpgpkeys=('C6D8FC68EE91033CB8BD913A3D633E44A057F8D5')

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x -o addopts=""
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
