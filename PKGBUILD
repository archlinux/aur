# Maintainer: willemw <willemw12@gmail.com>

_pkgname=podfox
pkgname=$_pkgname-git
pkgver=r71.cdcf304
pkgrel=2
pkgdesc="Catch and manage podcasts from the terminal"
arch=('any')
url="https://github.com/brtmr/podfox"
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('python-colorama' 'python-docopt' 'python-feedparser' 'python-pycurl' 'python-requests')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/brtmr/podfox.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  # Patch: add "global CONFIGURATION" statement
  sed -i 's|\(^[ \t]*\)\([^ ]*\)\( = json.load\)|\1global \2\n\1\2\3|' podfox/__init__.py
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

