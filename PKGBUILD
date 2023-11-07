# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-md_toc
pkgver=8.2.1
pkgrel=1
pkgdesc="Automatically generate and add an accurate table of contents to markdown files"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=4.0.0')
makedepends=('python-pyfakefs'
             'python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' 'fdb9e8415c3c0a04b3febd365fb159bf6aad01e4df5bd7aee8d90e76d5c9dc0ed916dd54dd378b921bf2fe9e34c47b51858ae0f1ef726a428d7630d2049034ee')

check() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    # Disable unit tests for the moment.
    # See this bug report:
    # https://blog.franco.net.eu.org/software/CHANGELOG-md-toc.html#plan-for-822
    #    python -m unittest discover --failfast --locals --verbose
}

build() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/md-toc-"${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
