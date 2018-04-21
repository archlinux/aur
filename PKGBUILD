# Maintainer : Fenner Macrae <fmacrae.dev at gmail dot com>

_pkgname=busco
pkgname=$_pkgname-git
pkgrel=1
pkgver=3.0.0
pkgdesc="Benchmarking sets of Universal Single-Copy Orthologs"
url="https://gitlab.com/ezlab/busco"
depends=('python')
makedepends=('git' 'python-setuptools')
conflicts=('busco')
provides=('busco')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}"/"${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -Dm755 scripts/run_BUSCO.py "${pkgdir}"/usr/bin/busco
    install -Dm755 scripts/generate_plot.py "${pkgdir}"/usr/bin/busco_generate_plot
}
