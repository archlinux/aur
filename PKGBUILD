# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=qspectrumanalyzer-git
pkgver=v1.4.0.r31.e7b998f
pkgrel=1
pkgdesc="Spectrum analyzer for multiple SDR platforms (PyQtGraph based GUI for soapy_power, rx_power, rtl_power, hackrf_sweep and other backends)"
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-pyqt4' 'python-pyqtgraph')
makedepends=('git' 'python-setuptools')
optdepends=(
  'soapy_power: default SoapySDR based backend (supports RTL-SDR, HackRF, Airspy, SDRplay, LimeSDR, bladeRF, USRP and other SDR devices)'
  'rx_tools: rx_power backend for SoapySDR devices (slower than soapy_power)'
  'rtl-sdr: rtl_power backend for RTL-SDR devices'
  'rtl-sdr-keenerd-git: rtl_power backend for RTL-SDR devices (better implementation)'
  'rtl_power_fftw-git: alternative fast rtl_power implementation using FFTW library'
  'hackrf: hackrf_sweep backend for HackRF devices'
)
conflicts=('qspectrumanalyzer')
provides=('qspectrumanalyzer')
source=('git+https://github.com/xmikos/qspectrumanalyzer.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
