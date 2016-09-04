# Maintainer: Quan Guo <guotsuan at gmail dot com>

pkgname=(python-numba-llvmlite-git python2-numba-llvmlite-git)
pkgbase=python-numba-llvmlite-git
pkgver=0.29.0.dev.r9.gbd492b8
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVMLITE, which is able to 
work with LLVM 3.7, rather than LLVMPY."
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
backup=()
source=(git+https://github.com/numba/numba.git)
makedepends=('git' 'cython' 'cython2')
md5sums=('SKIP')

_gitname=numba

prepare() {
  cp -a ${_gitname}{,-py2}
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package_python-numba-llvmlite-git() {
  provides=('python-numba' )
  replaces=('python-numba')
  conflicts=('python-numba-git' 'python-numba')  
  depends=('python' 'python-llvmlite' 'python-funcsigs')

  cd ${srcdir}/${_gitname}
  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
  mv ${pkgdir}/usr/bin/pycc ${pkgdir}/usr/bin/pycc3 
  mv ${pkgdir}/usr/bin/numba ${pkgdir}/usr/bin/numba3
}


package_python2-numba-llvmlite-git() {
  provides=('python2-numba')
  replaces=('python2-numba')
  depends=('python2' 'python2-llvmlite' 'python2-funcsigs')
  confilicts=('python2-numba-git' 'python2-numba')

  cd ${srcdir}/${_gitname}-py2
  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
  #mv ${pkgdir}/usr/bin/pycc ${pkgdir}/usr/bin/pycc3 
  #mv ${pkgdir}/usr/bin/numba ${pkgdir}/usr/bin/numba3
}
