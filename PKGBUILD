# Maintainer: Ray Ganardi <rayganardi [at] gmail [dot] com>
# Contributor: Andres F. Urquijo <alfagalileox@gmail.com>
# Contributor: Sebastian Krämer <basti.kr@gmail.com>
_name=qutip
_pkgname=qutip
pkgname=python-qutip
pkgver=4.4.1
pkgrel=1
pkgdesc="QuTiP is open-source software for simulating the dynamics of open quantum systems"
arch=("x86_64")
url="http://qutip.org/index.html"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-matplotlib" "cython")
makedepends=("gcc-fortran")
optdepends=(
    "blas: Optional, Needed for installing Fortran Monte Carlo solver."
    "mayavi: Optional, Needed for using the Bloch3d class."
    "python-pyqt4: Optional, required only for GUI elements."
    "texlive-bin: Optional, Needed if using LaTeX in figures."
    "python-nose: Optional, For running tests."
    "python-scikit-umfpack: Optional, Faster (~2-5x) steady state calculations."
    "openmp: Optional, For OPENMP support"
)

source=("http://qutip.org/downloads/$pkgver/$_name-$pkgver.tar.gz")
md5sums=('4dc49f4c05151f58e49238b6b3f22e18')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    if pacman -Qq openmp 2&>1 > /dev/null; then
	    python setup.py build --with-openmp
    else
	    python setup.py build
    fi
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
