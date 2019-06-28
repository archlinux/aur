# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
pkgver=1.9.9
_pycxxver=7.1.0
pkgrel=1
pkgdesc="The Pythonic interface to Subversion"
url="https://pysvn.sourceforge.io/"
depends=('python>=3.1.3' 'subversion' 'apr')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('Apache')
source=("https://downloads.sourceforge.net/project/pysvn/pysvn/V${pkgver}/pysvn-${pkgver}.tar.gz")
md5sums=('e76e5d79fa07173ded54cd18c8f605c9')

build() {
  cd "$srcdir/pysvn-$pkgver/Source"
  python3 setup.py configure --norpath --verbose --pycxx-dir="../Import/pycxx-${_pycxxver}"
  make
}

# tests currently don't work

# check() {
#   cd "$srcdir/pysvn-$pkgver/Tests"
#   # tests fail with latest subversion
#   LC_ALL="en_US.UTF-8" make
# }

package() {
  _pyver=$(python -c 'import sys; print(sys.version_info.minor)')
  cd "$srcdir/pysvn-$pkgver/Source"
  install -Ddm755 "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/"
  install -Dm644 pysvn/__init__.py "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/__init__.py"
  install -Dm755 "pysvn/_pysvn_3_${_pyver}.so" "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/_pysvn_3_${_pyver}.so"
}
# vim: set ts=2 sw=2 et:
