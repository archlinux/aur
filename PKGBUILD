# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-weather-bzr
pkgver=r358
pkgrel=4
pkgdesc="Comprehensive weather notification system, implemented using the indicator applet API (Canonical Ayatana Project)"
arch=('any')
url="https://launchpad.net/weather-indicator"
license=('GPL3')
depends=('libappindicator-gtk3' 'libgweather' 'python2-pywapi' 'python2-pytz')
optdepends=('python2-unidecode: for ASCII transliterations of Unicode text')
makedepends=('bzr' 'python2-distutils-extra' 'python-dulwich')
provides=("${pkgname%-bzr}")
conflicts=("${pkgname%-bzr}")
source=($pkgname::bzr+lp:weather-indicator)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  sed -i "s|share/common-licenses/GPL-3|share/licenses/common/GPL3/license.txt|" bin/indicator-weather
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/indicator-weather/AUTHORS"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

