# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('python-sqlalchemy-git')
pkgver=2.0.0b1.rc14697.79e047806
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
makedepends=('git' 'python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("git+https://github.com/sqlalchemy/sqlalchemy.git")
md5sums=('SKIP')

pkgver() {
  cd sqlalchemy
  printf %s.rc%s.%s "$(awk '/\:version\:/ {print $2}' doc/build/changelog/changelog_*|sort|tail -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r sqlalchemy sqlalchemy2
}

build() {
  cd sqlalchemy
  python setup.py build
}

package_python-sqlalchemy-git() {
  provides=("python-sqlalchemy=$pkgver")
  conflicts=('python-sqlalchemy')
  depends=('python')
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

