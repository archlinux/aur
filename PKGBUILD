# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=ytsp
pkgname=python-$_pkgname-git
pkgver=r339.0ead13a
pkgrel=1
pkgdesc="Search and get YouTube videos and playlists"
arch=('any')
url="https://github.com/jonesroot/ytsp"
license=('MIT')
depends=('python-httpx')
makedepends=('git' 'python-setuptools')
provides=("python-$_pkgname" 'youtube-search-python')
conflicts=("python-$_pkgname" 'youtube-search-python')
source=("git+${url}.git#branch=dev")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
