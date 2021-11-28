# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-simpleaudio
_pkgname=py-simple-audio
pkgver=1.0.4
pkgrel=5
pkgdesc='A simple audio playback Python extension'
arch=('x86_64' 'aarch64')
url='https://github.com/hamiltron/py-simple-audio/'
license=('MIT')
depends=('alsa-lib' 'python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hamiltron/py-simple-audio/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('843f208fd9c2f644cfd5c2c6f795259c53846681fb4df662ab3e5cf2ec8aba28')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${_pkgname}-${pkgver}"
    python setup.py test
}

package() {
    cd "${_pkgname}-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --optimize='1' --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
