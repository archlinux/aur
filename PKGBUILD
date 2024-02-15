# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-md_toc
pkgver=8.2.3
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
sha512sums=('SKIP' 'cf76d5a641fae6dfd3746f76f20ad8f40377b2198ee0c0ae01a7483a26181783294d4a69fe0253d50cc0234a4521dfcadb0897991153b9decca06c0c2ce8adb1')

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
