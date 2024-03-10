# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-pywapi-git
pkgver=r126.7f05282
pkgrel=2
pkgdesc='Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs'
arch=(any)
url=https://launchpad.net/python-weather-api
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#source=($pkgname::git+https://github.com/khurshid-alam/python-weather-api.git)
source=("$pkgname::git+https://git.launchpad.net/~khurshid-alam/python-weather-api/+git/trunk")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
