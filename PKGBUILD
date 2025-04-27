# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Creator: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Poor fork: Qtra Gabriex <qtra@gabriex.xyz>

# Extra Credits:
# https://github.com/ianmorti
# https://github.com/arobertson404
# (from issues page https://github.com/xmikos/qspectrumanalyzer/issues)

pkgname=qspectrumanalyzerg
_pkgname=qspectrumanalyzer
pkgver=2.2.0.r9.b8f93f5
pkgrel=1
pkgdesc="Community fixed version of qspectrumanalyzer."
arch=('any')
url="https://gabriex.xyz/archives/wares/qspectrumanalyzerg.tar.zst"
license=('GPL3')
depends=('python-pyqt5' 'python-pyqtgraph' 'soapy_power' 'python-qt.py' 'python-setuptools')
makedepends=('git')
optdepends=('rtl_power_fftw: alternative RTL-SDR backend using FFTW library. Much faster than rtl_power.'
	    'rtl-sdr-keenerd: better version of rtl_power backend'
	    'rtl-sdr: original rtl_power backend. Slightly broken, use rtl-sdr-keenerd-git instead.'
	    'rx_tools: rx_power backend. Wniversal SoapySDR based backend, but seems slow and buggy.'
	    'hackrf: hackrf_sweep backend. Wideband spectrum monitoring with sweep rate of 8 GHz/s.')
conflicts=('qspectrumanalyzer')
provides=('qspectrumanalyzerg')
source=('https://gabriex.xyz/archives/wares/qspectrumanalyzerg.tar.zst')
sha256sums=('682dd6d65c07509004197a8ab54d97916f3d3215fc4a9a60c04ad477a1d551fd')

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
