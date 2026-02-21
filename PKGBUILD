# Maintainer: Aleksei <aur at devass dot club>
# Contributor: Aloxaf <aloxafx at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=5.4.2
pkgrel=1
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
sha256sums=('3ec2e183d2c9a3eb46be9eb43a12866ad8e2640e3d7ad023431de5f406a605d0')

prepare() {
        cd "$srcdir/s3ql-${pkgver}"
}

build() {
        cd "$srcdir/s3ql-${pkgver}"
        python -m build --wheel --no-isolation
}

package() {
        cd "$srcdir/s3ql-${pkgver}"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
