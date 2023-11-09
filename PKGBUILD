# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-md_toc
pkgver=8.2.2
pkgrel=1
pkgdesc="Automatically generate and add an accurate table of contents to markdown files"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=4.0.1')
makedepends=('python-pyfakefs'
             'python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' '8daadd080e86c89d1205c01d8d264e6e287d33cde8d1bc2e24e8d6673ec288870a0c9bdd296bacdb2e8eb3a516a77f4fbbc1220497c70f61b38cd29110cc64f0')

check() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    python -m unittest discover --failfast --locals --verbose
}

build() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
