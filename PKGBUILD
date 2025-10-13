# Maintainer: envolution
# Contributor: neolouker <neolouker@gmail.com>
# Contributor: ramen <hendrik@hndrkk.sh>
# Contributor: ra1nb0w
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=quisk
pkgver=4.2.46
pkgrel=1
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
b2sums=('1632a1ad67839a571e6ae303f92ee7e94316d3560648381451e6b0d48693442d0f3ca74bd65457e8a9435ff442dc4f81a35bbb02847cd0e131d13392ebbe32c9'
        '11e81951156ed35888ccdd1a528a4adab29dc0a5d4b5aa1e3cc64e476ec7770ce034e7f403ad93e374a169d0f5df7e4e9080cd837f756a3b9de67a8d0613a00a'
        'c54e29d4595a31b4f33203396b84808c00a91db58416c8b25ec6e4ded0635a53146d11d21b4ac41bf9b4897711413f35c921d39e2c7e820b4b69ffb303354014')

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
# vim:set ts=2 sw=2 et:
