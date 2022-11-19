# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-pymboot
pkgver=0.3.0
pkgrel=1
pkgdesc='Python based library for communication with NXP MCU Bootloader.'
arch=(any)
url='https://github.com/molejar/pyMBoot'
license=(BSD)
depends=(python-{bincopy,click,pyenum,pyserial,pyusb})
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-pytest)
source=("https://github.com/molejar/pyMBoot/archive/${pkgver}/pyMBoot-${pkgver}.tar.gz")
b2sums=('ba665d97235943559cb839e4af56cbd78a46d2dadd528ebe545e431694c78886bda819d3f192ce5e14f0fb296d9ef328b2a29800725c94e618f577eab69a4122')

build() {
  cd pyMBoot-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd pyMBoot-${pkgver}
  python -m pytest
}

package() {
  cd pyMBoot-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
