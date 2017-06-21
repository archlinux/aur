# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-ase' 'python2-ase')
pkgver=3.14.0
_sha=5081e4e256df500c85fd9284dc29746cb21d7732
pkgrel=1
pkgdesc="Atomic Simulation Environment (ASE) is a set of tools and Python modules for setting up, manipulating, running, visualizing and analyzing atomistic simulations."
url="http://wiki.fysik.dtu.dk/ase"
arch=("any")
license=('LGPLv2.1+')
makedepends=('python-setuptools')
source=("https://gitlab.com/ase/ase/repository/archive.tar.gz?ref=$pkgver")
md5sums=('30ee5006b266d9f1f319fe43e24a6802')

prepare() {
    cp -a "${srcdir}/ase-$pkgver-$_sha"{,-py2}
}

package_python-ase() {
    depends=('python-numpy')
    optdepends=('python-scipy: For extra functionality' 'python-matplotlib: 2D Plotting' 'pygtk: For ase.gui')
    cd "$srcdir/ase-$pkgver-$_sha"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-ase() {
    depends=('python2-numpy')
    optdepends=('python2-scipy: For extra functionality' 'python2-matplotlib: 2D Plotting' 'pygtk: For ase.gui')
    cd "$srcdir/ase-$pkgver-$_sha-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    rename ase ase2 $pkgdir/usr/bin/*
}
