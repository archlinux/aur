# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-weather-git
pkgver=r579.328ad88
pkgrel=1
pkgdesc="Comprehensive weather notification system, implemented using the indicator applet API (Canonical Ayatana Project)"
arch=('any')
url="https://launchpad.net/weather-indicator"
license=('GPL3')
depends=('libappindicator-gtk3' 'libgweather' 'python2-pywapi' 'python2-pytz')
optdepends=('python2-unidecode: for ASCII transliterations of Unicode text')
makedepends=('git' 'python2-distutils-extra')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#source=($pkgname::git+https://github.com/khurshid-alam/Weather-Indicator.git)
source=($pkgname::git+https://git.launchpad.net/~khurshid-alam/weather-indicator/+git/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

