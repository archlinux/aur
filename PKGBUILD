# Maintainer: Franco Masotti (See /README.md in project source)
# Contributor: Franco Masotti (See /README.md in project source)
pkgname=python-md_toc
pkgver=9.0.0
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
sha512sums=('SKIP' '17bd4a8138e3057c41501cd1cc84e5cc09b2e570efdb7de817e8a5cbbaf1a0857cefb8880bdb767dd37effd8323fefbb1c664484c5c9c6a08cecfab40eef3b39')

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
