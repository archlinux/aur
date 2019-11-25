# Maintainer: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-git
_pkgname=lutris
pkgver=0.5.3.r120.gd17fbee9
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'gtk3' 'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr' 'gnome-desktop' 'python-requests' 'python-pillow')
makedepends=('git' 'python-setuptools')
checkdepends=('xorg-server-xvfb' 'xterm' 'python-nose-cover3' 'wine' 'webkit2gtk')
optdepends=(
  'wine: Run windows games'
  'wine-staging: Run windows games - Staging patches'
  'python-evdev: Detecting connected joypads.'
  'python-pyinotify: Enhanced Steam integration.'
  'gamemode: Allows games to request a temporary set of optimisations.'
  )
provides=('lutris')
conflicts=('lutris')
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/v//; s/\([^-]*-g\)/r\1/;s/-/./g'

}

check() {
  cd ${_pkgname}

  xvfb-run nosetests --cover-erase --with-xunit --xunit-file=nosetests.xml --with-coverage --cover-package=lutris --cover-xml-file=coverage.xml
}

package() {
  cd ${_pkgname}

  python setup.py install --root="${pkgdir}" --optimize='1'
}
