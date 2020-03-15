pkgname=createrepo
pkgver=0.10.4
pkgrel=2
pkgdesc="Create rpm-metadata formatted package repositories"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('deltarpm' 'python2' 'python2-pyliblzma' 'python2-rpm'
         'urlgrabber' 'yum' 'yum-metadata-parser')
makedepends=('bash-completion')
checkdepends=('pychecker')
source=("$url/archive/$pkgname-${pkgver//./-}.tar.gz")
md5sums=('d5a31a4a075010d5c2e51fbf631a368f')

prepare() {
	mv "$pkgname-$pkgname-${pkgver//./-}" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	find -type f | xargs sed -e 's|#! */usr/bin/python|&2|' -i
}

build() {
	cd "$pkgname-$pkgver"
	make PYTHON=python2
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make PYTHON=python2 DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
