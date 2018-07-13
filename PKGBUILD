# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=qspectrumanalyzer-git
_pkgname=${pkgname%-git}
pkgver=2.2.0.r8.625ba9d
pkgrel=1
pkgdesc="Spectrum analyzer for multiple SDR platforms."
arch=('any')
url="https://github.com/xmikos/qspectrumanalyzer"
license=('GPL3')
depends=('python-pyqt5' 'python-pyqtgraph' 'soapy_power' 'python-qt.py' 'python-setuptools')
makedepends=('git')
optdepends=('rtl_power_fftw: alternative RTL-SDR backend using FFTW library. Much faster than rtl_power.'
	    'rtl-sdr-keenerd: better version of rtl_power backend'
	    'rtl-sdr: original rtl_power backend. Slightly broken, use rtl-sdr-keenerd-git instead.'
	    'rx_tools: rx_power backend. Wniversal SoapySDR based backend, but seems slow and buggy.'
	    'hackrf: hackrf_sweep backend. Wideband spectrum monitoring with sweep rate of 8 GHz/s.')
conflicts=('qspectrumanalyzer')
provides=('qspectrumanalyzer')
source=('git+https://github.com/xmikos/qspectrumanalyzer.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  cd "$srcdir"/$_pkgname
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
