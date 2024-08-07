# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: ramen <hendrik@hndrkk.sh>
# Contributor: ra1nb0w 
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>

pkgname=quisk
pkgver=4.2.36
pkgrel=2
pkgdesc='Software Defined Radio (SDR) transceiver that can control various radio hardware.'
arch=('x86_64' 'aarch64')
url='http://james.ahlstrom.name/quisk/'
license=('GPL-2.0-only')
depends=('python' 'python-pyusb' 'python-wxpython')
depends+=('portaudio' 'alsa-lib' 'libpulse' 'fftw' 'python-pyserial')
optdepends=('codec2: Enable FreeDV open digital voice codec'
            'soapysdr: Enable SoapySDR support')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/q/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  'icon.png'
  'quisk.desktop'
)
sha256sums=('4e7e7d1a004fc17e787555c7178d358632fc4b87eb819cd387f6456f297755ca'
            'a20dd6847c4554d79606cc86a1514671cbc2ef9d472d43e9c1b9d8d09665fbc8'
            '634f37687447651cd09d82583ce4a0ef5d39968f92b04671e3fbe6bbadf466a9')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/${pkgname}/${pkgname}_icon.png"
  install -Dm644 "${srcdir}/quisk.desktop" "${pkgdir}/usr/share/applications/quisk.desktop"
  install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
