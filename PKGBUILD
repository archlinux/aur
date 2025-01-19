# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-zotero
_pkgname=py${pkgname#python-}
pkgver=1.6.4
pkgrel=1
pkgdesc='A Python client for the Zotero API.'
arch=('any')
url='https://github.com/urschrei/pyzotero'
license=('Apache')
groups=()
depends=('python-feedparser' 'python-pytz' 'python-bibtexparser'
         'python-httpx')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90d3b26f9962f84a4515954b1e909139f631f942569375c0b4c061491a26cc39')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
