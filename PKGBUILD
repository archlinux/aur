# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-next-git
pkgver=0.9.5.r14.g3be0ad8
pkgrel=1
pkgdesc="News aggregator for Atom/RSS/RDF. Git version"
url="http://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
makedepends=('git')
optdepends=('python-requests: Needed by inoreader plugin')
conflicts=('canto-daemon')
provides=("canto-daemon=0.9.6")
source=('git://github.com/themoken/canto-next#branch=master')
md5sums=('SKIP')


pkgver() {
    cd ${_pkgname}
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
    cd ${_pkgname}
    # https://github.com/themoken/canto-next/issues/10
    git cherry-pick 5e6449d
}

package() {
    cd ${_pkgname}

    python setup.py install --prefix=/usr --root=${pkgdir} #--optimize=1
}
