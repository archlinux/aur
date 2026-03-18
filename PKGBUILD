# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-ngs
_source=sra-tools
pkgver=3.4.0
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
license=('NCBI-PD')
arch=('any')
source=("$_source-$pkgver.tar.gz::https://github.com/ncbi/sra-tools/archive/refs/tags/$pkgver.tar.gz")
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('6f60984a212d35b239244c23b9686e2a1131c76b92f0c41e8b56d3f5b6fff2d0')

build() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
