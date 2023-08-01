# Maintainer: ramen <hendrik@hndrkk.sh>
# Contributor: ra1nb0w 
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>

pkgname=quisk
pkgver=4.2.21
pkgrel=1
pkgdesc='Software Defined Radio (SDR) transceiver that can control various radio hardware.'
arch=('x86_64' 'aarch64')
url='http://james.ahlstrom.name/quisk/'
license=('GPL2')
depends=('python' 'python-pyusb' 'python-wxpython')
depends+=('portaudio' 'alsa-lib' 'libpulse' 'fftw' 'python-pyserial')
optdepends=('codec2: Enable FreeDV open digital voice codec'
            'soapysdr: Enable SoapySDR support')
makedepends=('python-pip' 'python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/q/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  'icon.png'
  'quisk.desktop'
)
sha256sums=('86cbd257cd1301e4dd5f78267e8e42a223a2f285488e5c43d69491083c08814a'
            'a20dd6847c4554d79606cc86a1514671cbc2ef9d472d43e9c1b9d8d09665fbc8'
            '634f37687447651cd09d82583ce4a0ef5d39968f92b04671e3fbe6bbadf466a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
  install -D "${srcdir}/icon.png" -m 0644 "${pkgdir}/usr/share/${pkgname}/${pkgname}_icon.png"
  install -D "${srcdir}/quisk.desktop" -m 0644 "${pkgdir}/usr/share/applications/quisk.desktop"
}
