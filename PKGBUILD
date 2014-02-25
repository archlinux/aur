# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sqlantaresia-git
pkgver=v0.5.59.g895e631
pkgrel=1
pkgdesc="SQL Antaresia is a MySQL administrative tool aimed at developers and sysadmins"
arch=(any)
url="https://github.com/mtorromeo/sqlantaresia"
license=('MIT')
depends=('python2-pyqt' 'python2-setproctitle' 'mysql-python' 'python2-dbutils' 'python2-qscintilla')
makedepends=('python2-setuptools' 'git')
optdepends=('python-paramiko: for automatic ssh tunnelling' 'pycrypto: for automatic ssh tunnelling')

source=('git://github.com/mtorromeo/sqlantaresia.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/sqlantaresia"
	git describe --tags --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/sqlantaresia"
	sh build.sh
}

package() {
	cd "$srcdir/sqlantaresia/"
	python2 setup.py install -O2 --root="$pkgdir"
	install -m0644 -D sqlantaresia.desktop "$pkgdir/usr/share/applications/sqlantaresia.desktop"
	install -D LICENSE "$pkgdir/usr/share/licenses/sqlantaresia/COPYING"
}
