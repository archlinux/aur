# Maintainer: Quan Guo <guotsuan at gmail dot com>

pkgname=(python-llvmlite-git python2-llvmlite-git)

pkgbase=python-llvmlite-git
_gitname=llvmlite
pkgver=0.6.0.r10.g6cf9861
pkgrel=1
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'python2' 'llvm' )
makedepends=('git' 'cython' 'cython2')
conflicts=()
replaces=()
backup=()
source=(${_gitname}::git+https://github.com/numba/llvmlite.git)
md5sums=('SKIP')


prepare() {
  cp -a ${_gitname}{,-py2}
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-llvmlite-git() {
  provides=('python-llvmlite') 

  cd ${srcdir}/${_gitname}
  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}


package_python2-llvmlite-git() {
  provides=('python2-llvmlite')

  cd ${srcdir}/${_gitname}-py2
  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}
