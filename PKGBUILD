# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=python-remind-caldav-git
pkgname=python-remind-caldav-git
_module='remind-caldav'
pkgver=0.7.0.r2.gfa82424
pkgrel=3
pkgdesc="Tools to sync between 'remind' and CalDAV"
url="https://github.com/jspricke/remind-caldav"
depends=('python' 'python-dateutil' 'python-vobject' 'python-caldav' 'python-remind')
optdepends=('python-keyring: manage password')
makedepends=('python-setuptools' 'git' 'patch')
provides=('python-remind-caldav')
conflicts=('python-remind-caldav')
license=('GPL')
arch=('any')
source=("remind-caldav::git+https://github.com/jspricke/remind-caldav" "fix-missing-from-os-import-path.patch")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${_module}"
    patch --forward --strip=1 --input="${srcdir}/fix-missing-from-os-import-path.patch"
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
