# Maintainer: Thomas Haider <t.haider@deprecate.de>
pkgname=bley-git
pkgver=r373.6749631
pkgrel=1
pkgdesc="Intelligent greylisting daemon for postfix and exim"
arch=(any)
url="http://bley.mx"
license=('BSD')
depends=('python-pyspf' 'python-twisted' 'python-ipaddress' 'python-publicsuffix')
optdepends=('postfix: mail server (Message Transfer Agent)'
			'exim: mail server (Message Transfer Agent)'
			'sqlite: required for SQLite support'
			'python-psycopg2: required for PostgreSQL support'
			'python-mysqlclient: required for MySQL support'
			'python-matplotlib: required for bleygraph')
makedepends=('git' 'python-setuptools')
provides=("bley")
conflicts=("bley")
install='bley.install'
source=("${pkgname}::git+https://github.com/evgeni/bley.git"
		"bley.install")
md5sums=('SKIP'
         'ce7ed2174176dfcb0ca2d526f3374e72')

pkgver() {
	cd "$srcdir/${pkgname-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname-git}"
	python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
