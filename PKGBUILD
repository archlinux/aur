# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mbdata-git
_pkgbase=${pkgbase%-git}
_name=${_pkgbase#python-}
pkgname=$pkgbase
pkgver=25.0.4.r3.g5d8cadf
pkgrel=1
pkgdesc='MusicBrainz database tools for Python'
url="https://github.com/lalinsky/$_name"
arch=('any')
license=('MIT')
depends=(python python-psycopg2 python-six)
makedepends=('python-setuptools' 'git')
provides=(${_pkgbase})
conflicts=(${_pkgbase})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$_name"
  python3 setup.py build
}

package() {
  cd "$_name"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -d "$pkgdir/usr/share/doc/$_pkgbase"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgbase" README.rst CHANGELOG.rst settings.py.sample mbslave.conf.default
}
