# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-ngs
_source=sra-tools
pkgver=3.0.5
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
sha256sums=('6dca9889ca9cfa83e9ce1c39bf7ae5654576fc79c4f608e902272a49573a05e0')

build() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
