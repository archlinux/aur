# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=python-remind-git
pkgname=python-remind-git
_module='remind'
pkgver=0.15.0.r0.g983c63b
pkgrel=1
pkgdesc="Remind Python library"
url="https://github.com/jspricke/python-remind"
depends=('remind' 'python' 'python-dateutil' 'python-pytz' 'python-tzlocal' 'python-vobject')
makedepends=('python-setuptools' 'git')
checkdepends=('python-coverage' 'python-nose')
provides=('python-remind')
conflicts=('python-remind')
license=('GPL')
arch=('any')
source=("remind::git+https://github.com/jspricke/python-remind")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

check(){
    cd "${srcdir}/${_module}"
    nosetests
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
