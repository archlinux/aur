# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='alphashape'
pkgname=("python-$_pkgname")
pkgver=v1.3.0.r23.g8edfd5e
pkgrel=1
pkgdesc="Toolbox for generating n-dimensional alpha shapes."
arch=('x86_64')
depends=('python'
         'python-sphinx'
         'python-geopandas'
         'python-cartopy'
         'python-descartes'
         'python-networkx'
         'python-ipympl'
         'python-trimesh'
         'python-rtree'
         'python-click-log'
	)
makedepends=('python-setuptools'
             'python-pytest')
url='https://alphashape.readthedocs.io/en/latest/index.html'
license=('MIT')
sha256sums=('SKIP')
#_source_url="https://files.pythonhosted.org/packages/2e/83/67ff905694df5b34a777123b59fdfd05998d5a31766f188aafbf5b340055"
#source=("$_source_url/$_pkgname-$pkgver.tar.gz")
source=(git+https://github.com/bellockk/alphashape.git)

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

check(){
    cd "$srcdir/$_pkgname"
    pytest
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
