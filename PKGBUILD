# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-xlsx2csv
_name=xlsx2csv
pkgver=0.8.1
pkgrel=1
pkgdesc="xlsx to csv converter"
arch=(any)
url="https://github.com/dilshod/xlsx2csv"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(https://github.com/dilshod/xlsx2csv/archive/$pkgver.tar.gz)

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir -p $pkgdir/usr/share/man/man1
    cd man
    make
    install $_name.1 $pkgdir/usr/share/man/man1/$_name.1
}
md5sums=('5c105ac18e1573f453e646be2480a826')
sha256sums=('720894b55f9229e693f389fa760ab4993b8fa17163a8e1beee21e7f975312766')
