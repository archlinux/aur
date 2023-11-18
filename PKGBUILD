# Maintainer: Thomas Haider <t.haider@deprecate.de>
pkgname=bley-git
pkgver=r543.9e350b0
pkgrel=1
pkgdesc="Intelligent greylisting daemon for postfix and exim"
arch=(any)
url="http://bley.mx"
license=('BSD')
depends=('python-pyspf' 'python-twisted' 'python-publicsuffix2')
optdepends=('postfix: mail server (Message Transfer Agent)'
			'exim: mail server (Message Transfer Agent)'
			'sqlite: required for SQLite support'
			'python-psycopg2: required for PostgreSQL support'
			'python-mysqlclient: required for MySQL support'
			'python-matplotlib: required for bleygraph')
makedepends=('git' 'python-setuptools')
provides=("bley")
conflicts=("bley")
install='bley.sysusers'
source=("${pkgname}::git+https://github.com/evgeni/bley.git"
            "bley.sysusers")
md5sums=('SKIP'
         '4c5d548dd75a3b40c8b5b8f5c74f76ef')

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
    install -Dm 644 ../bley.sysusers "${pkgdir}"/usr/lib/sysusers.d/bley.conf
}
