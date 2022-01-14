# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-sqlalchemy-git
pkgver=2.0.0b1.r14754.a869dc8fe
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
provides=("python-sqlalchemy=$pkgver")
conflicts=('python-sqlalchemy')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
source=("git+https://github.com/sqlalchemy/sqlalchemy.git")
md5sums=('SKIP')

pkgver() {
  cd sqlalchemy
  printf %s.r%s.%s "$(awk '/:version:/ {print $2}' doc/build/changelog/changelog_*|sort|tail -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd sqlalchemy
  python setup.py build
}

package() {
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

