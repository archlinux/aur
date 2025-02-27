# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name-git
pkgver=0.14.2.r21.gba26525
pkgrel=1
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=('any')
url="https://github.com/ickc/$_name"
license=('GPL3')
_pydeps=(panflute
         numpy
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=('git'
             'python-build'
             'python-poetry-core'
             'python-installer')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "${pkgname}"
    python -m build -wn
}
package() {
    cd "${pkgname}"
    python -m installer -d "$pkgdir" dist/*.whl
}
