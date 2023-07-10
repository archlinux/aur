# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-ngs
_source=sra-tools
pkgver=3.0.6
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
sha256sums=('9fecfd819ee9beaf8a1d3e4b76a5d49e747bc064525b40416e0730a168986348')

build() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$_source-$pkgver"/ngs/ngs-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
