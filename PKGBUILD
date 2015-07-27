# Maintainer: Quan Guo <guotsuan at gmail dot com>

pkgname=(python-llvmlite-git python2-llvmlite-git)

_gitname=llvmlite
pkgver=0.4.0.r78.ga37d958
pkgrel=1
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'python2' 'llvm' )
makedepends=('git' 'cython' 'cython2')
provides=('python-llvmlite' 'python-2-llvmlite')
conflicts=()
replaces=()
backup=()
source=(${_gitname}::git+https://github.com/numba/llvmlite.git#branch=llvm3.6)
md5sums=('SKIP')


prepare() {
  cp -a ${_gitname}{,-py2}
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-llvmlite-git() {
  cd ${srcdir}/${_gitname}
  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}


package_python2-llvmlite-git() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}
