# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=python-rootpy-git
pkgver=r3965.457e0740
pkgrel=1
pkgdesc="Pythonic interface with ROOT on top of the existing PyROOT bindings"
arch=('any')
url="http://www.rootpy.org/"
license=('BSD')
conflicts=('python-rootpy')
provides=('python-rootpy')
depends=('python'
         'root')
makedepends=('git' 'python-setuptools')
optdepends=('python-numpy: Increase speed'
            'python-root_numpy: Increase speed'
            'python-matplotlib: Plotting'
            'python-pytables: HDF5 IO in rootpy.root2hdf5'
            'readline: Roosh (interactive root shell)'
            'python-termcolor: Roosh (interactive root shell)'
            'python-uncertainties: Uncertainties handeling')
#checkdepends=('python-nose')
options=(!emptydirs)
source=('git+https://github.com/rootpy/rootpy')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/rootpy"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#check() {
#    cd "${srcdir}/rootpy"
#    make test-code
#}

package() {
    cd "${srcdir}/rootpy"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

