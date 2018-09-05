# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=pocket-cli
pkgname=python-$gitname
pkgver=44.9d94cac
pkgrel=1
pkgdesc="A terminal application for Pocket"
arch=(any)
license=(MIT)
url="https://github.com/rakanalh/${gitname}"
depends=(
    python
    python-click
    python-future
    python-pocket-api
    python-progress
    python-requests
    python-six
)
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
    rm "$pkgdir"/usr/lib/python*/site-packages/pocket_cli-*.egg-info/requires.txt
}
