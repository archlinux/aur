# Maintainer: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-beta
_pkgname=lutris
pkgver=0.5.0b3
_pkgver=0.5.0beta3
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://github.com/lutris/lutris'
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'gtk3' 'glib2' 'psmisc' 'cabextract' 'unrar' 'unzip' 'p7zip' 'curl' 'xorg-xrandr' 'gnome-desktop' 'python-requests' 'python-pillow')
makedepends=('python-setuptools')
checkdepends=('xorg-server-xvfb' 'xterm' 'python-nose-cover3' 'wine')
optdepends=('wine: Run windows games'
            'wine-staging: Run windows games - Staging patches'
	    'python-evdev: Detecting connected joypads.'
  	    'python-pyinotify: Enhanced Steam integration.'
	   )
provides=('lutris')
conflicts=('lutris')
source=("$url/archive/v${_pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd ${_pkgname}-${_pkgver}

  python setup.py build
}

check() {
  cd ${_pkgname}-${_pkgver}

  xvfb-run nosetests --cover-erase --with-xunit --xunit-file=nosetests.xml --with-coverage --cover-package=lutris --cover-xml-file=coverage.xml
}

package() {
  cd ${_pkgname}-${_pkgver}

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
