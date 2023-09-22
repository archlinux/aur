# Maintainer: willemw <willemw12@gmail.com>

pkgname=castero-git
pkgver=0.9.5.r6.gd229ebe
pkgrel=1
pkgdesc='Podcast client for the command line'
arch=(any)
url=https://github.com/xgi/castero
license=(MIT)
depends=(python-beautifulsoup4 python-cjkwrap python-grequests python-lxml python-mpv python-requests python-pytz python-vlc)
#checkdepends=(python-codacy-coverage python-coverage python-pytest)
makedepends=(git python-build python-installer python-wheel)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  python -m installer --destdir="$pkgdir" dist/*.whl
}
