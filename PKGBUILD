# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=python-remind-caldav-git
pkgname=python-remind-caldav-git
_module='remind-caldav'
pkgver=0.7.1.r0.g2250b51
pkgrel=1
pkgdesc="Tools to sync between 'remind' and CalDAV"
url="https://github.com/jspricke/remind-caldav"
depends=('python' 'python-dateutil' 'python-vobject' 'python-caldav' 'python-remind')
optdepends=('python-keyring: manage password')
makedepends=('python-setuptools' 'git' 'patch')
provides=('python-remind-caldav')
conflicts=('python-remind-caldav')
license=('GPL')
arch=('any')
source=("remind-caldav::git+https://github.com/jspricke/remind-caldav")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
