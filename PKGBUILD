# Maintainer: Leon <adigitoleo@protonmail.com>
pkgname=python-enaml-git
_shortname="${pkgname%-git}"
pkgver=0.12.0.r2.g6554c803
pkgrel=4
pkgdesc="Declarative User Interfaces for Python"
arch=(x86_64)
url="https://github.com/nucleic/enaml"
license=('custom')
depends=('python-qtpy' 'python-ply' 'python-kiwisolver' 'python-atom' 'python-bytecode')
makedepends=('python-setuptools' 'python-cppy' 'git')
provides=("$_shortname")
conflicts=("$_shortname")
source=("$_shortname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_shortname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_shortname"
    python setup.py build
}

package() {
    cd "$srcdir/$_shortname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_shortname/"
}
