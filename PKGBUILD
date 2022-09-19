# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=python-pagegen
_pkgname="${pkgname#python-}"
pkgver=3.8.0
pkgrel=1
pkgdesc='Python static site generator with reStructuredText markup'
arch=('any')
license=('GPL')
url='https://github.com/oliverfields/pagegen'
depends=(
	'python-docutils'
	'python-docutils-graphviz'
	'python-htmlmin'
	'python-jsmin'
	'python-libsass'
	'python-lxml'
	'python-mako'
	'python-markdown'
	'python-markupsafe'
	'python-rcssmin'
	'python-six')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e37d421166503ef6e86878efb6bc95bbce30cd6729512e95340f7ec14eece4ec')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
