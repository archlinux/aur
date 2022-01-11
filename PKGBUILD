# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=3.8.1
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('x86_64')
url="https://github.com/s3ql/s3ql/"
license=('GPL3')
depends=(
	'python-cryptography'
	'python-defusedxml'
	'python-apsw'
	'python-trio'
	'python-pyfuse3'
	'python-dugong'
	'python-systemd'
	'python-requests'
	'python-google-auth'
	'python-google-auth-oauthlib')
makedepends=('python-setuptools')
install=s3ql.install
changelog=CHANGELOG
source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/release-$pkgver/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/release-$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('d4731ebaacadca38a677bb18a99446c19d4f5b573628d55371f715acace11c4c'
            'SKIP')
validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F') # Nikolaus Rath

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
