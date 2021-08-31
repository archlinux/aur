# Maintainer: matheuz1210 <matheuz1210 at gmail dot com>

pkgname=wsid-git
pkgver=0.3.r0.313eb8d
pkgrel=1
pkgdesc='web show image directory'
arch=(any)
url='https://github.com/matheuz1210/wsid'
license=(GPL)
depends=(
    'python>=3.9' )
makedepends=(
    git )
optdepends=(
    'python-pyqt5: for gui' )
source=(
    "${pkgname%-git}::git+${url}" )
b2sums=(SKIP)

pkgver(){
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build(){
    cd "${srcdir}/${pkgname%-git}"
    python - build <<<"from setuptools import setup; setup()"
}

package(){
    cd "${srcdir}/${pkgname%-git}"
    python - install --root="${pkgdir}" --optimize=1 --skip-build <<<"from setuptools import setup; setup()"
}
