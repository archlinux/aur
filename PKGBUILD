# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python2-odespy-git
_pkgver=0.2.0
pkgver=0.2.0.r147.1db410c
pkgrel=1
pkgdesc="Easy access in Python to a large collection of ODE solvers."
arch=('i686' 'x86_64')
url="http://hplgit.github.io/odespy/doc/web/index.html"
license=('GPL')
depends=('python2' 'python2-numpy')
makedepends=('python2-setuptools' 'gcc-fortran')
conflicts=('python2-odespy')
provides=('python2-odespy')
source=("git+https://github.com/hplgit/odespy.git")
md5sums=('SKIP')
optdepends=('python2-nose: necessary for basic tests'
            'python2-sympy: used in Sympy_odefun'
            'python2-scipy: necessary for Vode, Dopri5 and Dop853 solvers'
            'python2-scitools: plot curves in demos'
            'python2-odelab')

pkgver() {
    cd ${srcdir}/odespy
    printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/odespy
    # workaround: some flag is preventing compilation to finish, need to
    # investigate more to find out what is the problem. My flags (from
    # makepkg.conf) are:
    # -Wl,-O1,--sort-common,--as-needed,-z,relro
    unset LDFLAGS
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}
