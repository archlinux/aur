# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-sundials
_pkgname=pysundials
pkgver=2.5.0a1
_pkgver=2.5.0-a1
pkgrel=1
pkgdesc="Python wrapper for the SUite of Non-linear DIfferential/ALgebraic Solvers (SUNDIALS)"
arch=('i686' 'x86_64')
depends=('python2' 'sundials')
replaces=('python2-pysundials')
url="http://pysundials.sourceforge.net/"
license=('BSD')
source=("http://sourceforge.net/projects/pysundials/files/$_pkgname-$_pkgver.tar.gz" "config")
md5sums=('d3bc1233aaaf55c0d42da838ceea9f14'
         '880551f9fba1d77db7e5a3f7f77f7e69')

prepare() {
    cd "$_pkgname-$_pkgver"
    sed -i "/compiler.link_shared_lib/s|-fPIC']|-fPIC', '-llapack']|" setup.py
    sed -i "/smalldense.h/d" src/realtype.c
}

build() {
    cd "$_pkgname-$_pkgver"
    python2 setup.py build
}

package() {
    cd "$_pkgname-$_pkgver"
    python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
    pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
    install -Dm644 ../config "$pkgdir/$pydir/$_pkgname/config"
}

