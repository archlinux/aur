pkgbase=pywbem
pkgname=('python-pywbem'
         'python2-pywbem')
pkgver=0.9.0
pkgrel=2
pkgdesc="Python WBEM Client and Provider Interface"
arch=('any')
url='https://github.com/pywbem/pywbem'
license=('LGPLv2.1+')
makedepends=('python3' 'python-pip' 'python-yaml' 'python-ply'
             'python2' 'python2-pip' 'python2-yaml' 'python2-ply')
source=("https://github.com/$pkgbase/$pkgbase/archive/v${pkgver}.tar.gz")
sha256sums=('e5a38cfffceca2bb984a531b17837c5d6a89cdbdedf08a527712bc365f19f2bb')

build() {
    :
}

package_python-pywbem() {
    _PY3_SITELIB=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
    cd $srcdir/$pkgbase-${pkgver}
    python3 setup.py build || return 1
    env PYTHONPATH="$pkgdir/$_PY3_SITELIB" \
        python3 setup.py install --root=$pkgdir || return 1
    rm -fv $pkgdir/usr/bin/*.bat
}

package_python2-pywbem() {
    _PY2_SITELIB=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
    cd $srcdir/$pkgbase-${pkgver}
    python2 setup.py build || return 1
    env PYTHONPATH="$pkgdir/$_PY2_SITELIB" \
        python2 setup.py install --root=$pkgdir || return 1
    rm -rf $pkgdir/usr/bin
}
