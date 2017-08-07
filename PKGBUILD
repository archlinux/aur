# Maintainer: Luigi Guevara <@killua99>
# Maintainer: twa022 <twa022 at gmail dot com>
# Author: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>

_pkgname=my-weather-indicator
pkgname=my-weather-indicator-git
pkgver=r44.e5c76af
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('i686' 'x86_64')
url='https://launchpad.net/my-weather-indicator'
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'webkitgtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil'
         'python-requests-oauthlib' 'geoclue2' 'geoip')
makedepends=('git' 'python2-distutils-extra' 'python2-polib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://git.launchpad.net/my-weather-indicator")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Don't install to /opt and install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:/opt/extras.ubuntu.com/my-weather-indicator:/usr:g' \
           -e 's:locale-langpack:locale:g' '{}' \;
}

build() {
  cd "${_pkgname}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
