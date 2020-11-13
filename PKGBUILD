# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
# Comment: Since v1.1.0 there was no proper release on github,
# therefore, the package is currently built from the master branch
pkgname=python-hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=1.3.0
pkgrel=1
pkgdesc="traitsui (desktop) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPLv3')

depends=('python-hyperspy'
         'python-traitsui'
         'python-link-traits')

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-gui-traitsui')
conflicts=('hyperspy-gui-traitsui')
provides=('hyperspy-gui-traitsui')

#source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/v$pkgver.zip)
source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/master.zip)
#sha256sums=('997ec6218a6d764347125d5661f6b794a267d130427e9aadc039565037c1c667')
sha512sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkginst}-master/"
  rel_ver=$(grep -E "^__version__" ${pkginst}-master/version.py | awk '{print $3}' | tr -d \")
  commit=$(git rev-parse --short HEAD)
	echo "${rel_ver}.${commit}"
}

package() {
#  cd "$srcdir/$pkginst-$pkgver"
  cd "$srcdir/${pkginst}-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}
