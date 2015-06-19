# Contributor: Renato Coutinho <renato dot coutinho at gmail>
pkgname=python2-ode
pkgver=0.1a4
pkgrel=1
pkgdesc="User-friendly Python interface to ODE solvers"
arch=('i686' 'x86_64')
url="http://web.engr.illinois.edu/~mrgates2/ode/"
license=('GPL')
source=("http://web.engr.illinois.edu/~mrgates2/ode/ode-${pkgver}.tar.gz"
        "http://web.engr.illinois.edu/~mrgates2/ode/ode.patch")
md5sums=('4a706e6753902de3aef3986a81bbb803'
         '26f67b7ce7b6251ef3d1e118d77f35ff')

depends=('python2' 'python2-numpy' 'gcc-fortran')

build() {
    cd ${srcdir}/ode-${pkgver}
    patch -p1 < ${srcdir}/ode.patch
    python2 setup.py build
}

package() {
    cd ${srcdir}/ode-${pkgver}
    python2 setup.py install --prefix=/usr --root=${pkgdir}
    cp -r test/ ${pkgdir}/usr/lib/python2.7/site-packages/ode/
    cp README ${pkgdir}/usr/lib/python2.7/site-packages/ode/
}
