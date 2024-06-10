# Maintainer: Takanashi Rikka <ayasa0520@gmail.com>

_modname='gbulb'
pkgname='python-gbulb-git'
pkgver=0.6.5.r50.g244c510
pkgrel=1
pkgdesc='Implementation of asyncio using GLib'
arch=('any')
url='https://github.com/beeware/gbulb'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-gobject')
optdepends=('gtk3: Gtk application integration')
checkdepends=('python-tox')
source=("$_modname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_modname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${_modname}"
    python -m build 
}

check() {
    cd "${_modname}"
    tox -e py
}

package() {
    cd "${_modname}"
    python -I -m installer --destdir="${pkgdir}" dist/*.whl
}
