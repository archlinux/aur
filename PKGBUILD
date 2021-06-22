# Maintainer: willemw <willemw12@gmail.com>

pkgname=tv-overlord-git
pkgver=r446.f394059
pkgrel=1
pkgdesc="Download and manage TV shows"
arch=('any')
url="https://bitbucket.org/tvoverlord/tv-overlord"
license=('GPL')
depends=('python-beautifulsoup4' 'python-click' 'python-colorama' 'python-dateutil' 'python-feedparser' 'python-tvdb_api')
makedepends=('git' 'python-setuptools')
optdepends=('deluge: torrent client' 'transmission-cli: torrent client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i "s|'tvoverlord/search_providers'.*||" setup.py
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}

