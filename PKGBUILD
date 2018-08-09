pkgbase=pywbem
pkgname=('python-pywbem'
         'python2-pywbem')
pkgver=0.12.4
pkgrel=1
pkgdesc="Python WBEM Client and Provider Interface"
arch=('any')
url='https://github.com/pywbem/pywbem'
license=('LGPLv2.1+')
makedepends=('python3' 'python-pip' 'python-yaml' 'python-ply'
             'python2' 'python2-pip' 'python2-yaml' 'python2-ply')
source=("https://github.com/$pkgbase/$pkgbase/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('0b4306248ee0508dd5327e43c9d2da54ff8474df89fc99f33613b279ab087626')
depends=("python2-m2crypto" "python-six" "python-ply" "python2-six"
         "python2-ply" "python-pyaml" "python2-pyaml" "python2-pbr" "python-pbr")

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
