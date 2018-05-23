# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=qspectrumanalyzer-git
pkgver=v2.2.0.r8.625ba9d
pkgrel=1
pkgdesc="Spectrum analyzer for multiple SDR platforms (PyQtGraph based GUI for soapy_power, rx_power, rtl_power, hackrf_sweep and other backends)"
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-pyqt5' 'python-pyqtgraph' 'soapy_power' 'python-qt.py')
makedepends=('git' 'python-setuptools')
optdepends=(
  'rtl_power_fftw-git: alternative RTL-SDR backend using FFTW library (much faster than rtl_power)'
  'rtl-sdr-keenerd-git: better version of rtl_power backend'
  'rtl-sdr: original rtl_power backend (slightly broken, use rtl-sdr-keenerd-git instead)'
  'rx_tools: rx_power backend (universal SoapySDR based backend, but seems slow and buggy)'
  'hackrf: hackrf_sweep backend (wideband spectrum monitoring with sweep rate of 8 GHz/s)'
)
conflicts=('qspectrumanalyzer')
provides=('qspectrumanalyzer')
source=('git+https://github.com/xmikos/qspectrumanalyzer.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
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
