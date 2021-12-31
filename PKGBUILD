# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=3.8.0
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
install=s3ql.install
changelog=CHANGELOG
source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/release-$pkgver/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/release-$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('bc5e05b6d929c0cde12b9966f426d7eae20d6f6137aa9291dec8873154b49631'
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
