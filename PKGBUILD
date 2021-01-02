# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('python-pgzero-git')
_module='pgzero'
pkgver=1.2.post4.r132.gdf7c738
pkgrel=1
pkgdesc="A zero-boilerplate 2D games framework - git version"
url="http://pypi.python.org/pypi/pgzero"
depends=('python-numpy' 'python-pygame')
makedepends=('python-setuptools')
provides=('python-pgzero')
conflicts=('python-pgzero')
license=('GPL')
arch=('any')
source=('git+https://github.com/lordmauve/pgzero.git'
        'pygame-version.patch')
sha256sums=('SKIP'
            '632096b0b148917ade580c1fd5e39b6316b54efb566ca95cb6c922ae298956f5')

pkgver() {
  cd ${_module}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_module}
    patch --forward --strip=1 --input="${srcdir}/pygame-version.patch"
}

build() {
    cd ${_module}
    python setup.py build
}

package() {
    cd ${_module}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
