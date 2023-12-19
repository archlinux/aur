# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-ngs
_source=sra-tools
pkgver=3.0.10
pkgrel=1
pkgdesc="python module for NCBI NGS Language Bindings"
url="https://github.com/ncbi/sra-tools"
depends=(
         'python'
        )
makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
            )
license=('custom: Public Domain')
arch=('any')
source=("$_source-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/refs/tags/$pkgver.tar.gz")
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('93cfa802938506866b9d565a18a31ac84fd26f2929636b23f1f8dd9f39cf977d')

build() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
