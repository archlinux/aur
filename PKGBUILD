# Maintainer: Aleksei <aur at devass dot club>
# Contributor: Aloxaf <aloxafx at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=5.2.0
pkgrel=2
pkgdesc="A full-featured file system for online data storage."
arch=('x86_64')
url="https://github.com/s3ql/s3ql"
license=('GPL3')
depends=(
	'python-cryptography'
	'python-defusedxml'
	'python-apsw'
	'python-trio'
	'python-pyfuse3'
)
optdepends=(
	'python-systemd: for enabling systemd support'
	'python-requests: for OAuth2 authentication with Google Storage'
	'python-google-auth: for ADC authentication with Google Storage'
	'python-google-auth-oauthlib: for browser-based authentication with Google Storage'
)
makedepends=('python-setuptools' 'python-pip' 'python-wheel' 'cython')
install=s3ql.install
changelog=ChangeLog.rst
source=("https://github.com/s3ql/s3ql/releases/download/s3ql-${pkgver}/s3ql-${pkgver}.tar.gz")
sha256sums=('150e5f67071af334c98afd123bd95f101d4ba293cf353ae71b34c8e7f90a6155')

prepare() {
	cd "$srcdir/s3ql-${pkgver}"
}

build() {
	cd "$srcdir/s3ql-${pkgver}"
	python setup.py build_cython build_ext --inplace
}

package() {
	cd "$srcdir/s3ql-${pkgver}"
	python setup.py install --root="$pkgdir"
}
