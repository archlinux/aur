# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubelweb-git
pkgname=bigjubelweb-git
_module='bigjubelweb'
pkgver=0.7.7.r0.gf1b036b
pkgrel=1
pkgdesc="A web interface for BigJubel"
url="https://gitlab.com/dkabus/bigjubelweb"
depends=('bigjubel' 'sqlite' 'python' 'python-flask' 'python-werkzeug' 'python-yaml' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
provides=('bigjubelweb')
conflicts=('bigjubelweb')
license=('GPL')
arch=('any')
source=("${_module}::git+https://gitlab.com/dkabus/bigjubelweb")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_module}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}"
    make DESTDIR="$pkgdir/" install
    python -m installer --destdir="$pkgdir" dist/*.whl
}
