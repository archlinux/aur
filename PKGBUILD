# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname=python-rtrlib-git
pkgver=r51.2ade90e
pkgrel=1
pkgdesc="A cffi based rtrlib binding for python"
url="https://github.com/rtrlib/python-binding"
arch=('x86_64')
license=('MIT')
depends=('python' 'rtrlib' 'python-cffi')
makedepends=('python-setuptools' 'git')
source=("rtrlib-python-binding::git+https://github.com/rtrlib/python-binding")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/rtrlib-python-binding
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/rtrlib-python-binding
    python setup.py build
}


package() {
    cd ${srcdir}/rtrlib-python-binding
    python setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
