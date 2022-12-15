# Maintainer: Maxim Mikityanskiy <maxtram95@gmail.com>

_pkgname=certbot-dns-henet
pkgname=$_pkgname-git
pkgver=r18.acf13b4
pkgrel=2
pkgdesc="he.net DNS Authenticator plugin for Certbot"
arch=('any')
license=('MIT')
url="https://bitbucket.org/qt-max/$_pkgname"
depends=('certbot' 'python-acme' 'python-beautifulsoup4' 'python-requests'
         'python-setuptools')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://bitbucket.org/qt-max/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir"
}
