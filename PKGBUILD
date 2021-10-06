# Maintainer: Rudis Muiznieks <rudis@sitosis.com>

pkgname=python-jinja_pluralize-git
pkgver=r34.e947704
pkgrel=1
pkgdesc="Jinja2 pluralize filters"
arch=('any')
url="https://github.com/audreyfeldroy/jinja2_pluralize"
license=('BSD')
groups=()
depends=('python-inflect' 'python-jinja')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/audreyfeldroy/jinja2_pluralize.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  2to3 -wn .
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py clean --all
  python setup.py build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root "${pkgdir}/"
}
