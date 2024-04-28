# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Brian Douglass <https://github.com/bhdouglass/, http://bhdouglass.com/>

_pkgname=clickable
pkgname=clickable-git
pkgver=8.1.0.r0.gc6b5992
pkgrel=1
pkgdesc='Compile, build, and deploy Ubuntu Touch click packages all from the command line'
arch=('any')
url='https://gitlab.com/clickable/clickable'
license=('GPL3')
depends=(
    'android-tools'
    'docker'
    'python'
    'python-argcomplete'
    'python-cookiecutter'
    'python-jsonschema'
    'python-requests'
    'python-setuptools'
    'python-yaml'
)
optdepends=('xorg-xhost: for running on the desktop')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://gitlab.com/clickable/clickable.git')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
