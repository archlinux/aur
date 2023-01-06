# Maintainer: Franco Masotti <franco dot masotti at tutanota dot com>
# Contributor: Franco Masotti <franco dot masotti at tutanota dot com>
pkgname=python-md_toc
pkgver=8.1.8
pkgrel=1
pkgdesc="Automatically generate and add an accurate table of contents to markdown files"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=3.0.1')
makedepends=('python-pyfakefs'
             'python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' 'd74783efa30fd3b632936636958c209fa51a6cc0f676d4995581af84153b842167d29ec7b5644a7836322174742eb498c8ba315536683ec094d7c6fc261186dc')

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
