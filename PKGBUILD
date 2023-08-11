# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubelweb-git
pkgname=bigjubelweb-git
_module='bigjubelweb'
pkgver=0.7.6.r0.g0f7ce11
pkgrel=1
pkgdesc="A web interface for BigJubel"
url="https://gitlab.com/dkabus/bigjubelweb"
depends=('bigjubel' 'sqlite' 'python' 'python-flask' 'python-werkzeug' 'python-yaml' 'python-click')
makedepends=('python-setuptools' 'git')
provides=('bigjubelweb')
conflicts=('bigjubelweb')
license=('GPL')
arch=('any')
source=("bigjubelweb::git+https://gitlab.com/dkabus/bigjubelweb")
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
    make DESTDIR="$pkgdir/" install
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
