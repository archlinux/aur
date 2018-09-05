# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=pocket-api
pkgname=python-$gitname
pkgver=25.d8222dd
pkgrel=1
pkgdesc="A python wrapper around GetPocket API V3"
arch=(any)
license=(MIT)
url="https://github.com/rakanalh/${gitname}"
depends=(python python-requests)
makedepends=(python-setuptools git)
source=("git+$url.git")
sha512sums=(SKIP)

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

build() {
    cd "${srcdir}/${gitname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    rm "$pkgdir"/usr/lib/python*/site-packages/pocket_api-*.egg-info/requires.txt
}
