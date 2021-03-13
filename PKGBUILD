# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons')
pkgver=2.0.2
pkgrel=1
pkgdesc="A Nautilus, Nemo, and Caja extension to overlay icons on files in git repositories"
arch=('any')
url="https://github.com/chrisjbillington/${pkgname}"
license=('BSD 2-Clause "Simplified"')
depends=('python-gobject')
makedepends=('python-setuptools-scm')
optdepends=('python-nautilus: nautilus support'
            'nemo-python: nemo support'
            'python-caja: caja support')
conflicts=("${pkgname}-common"
           'git-caja-icons'
           'git-nemo-icons')
replaces=("${pkgname}-common"
           'git-caja-icons'
           'git-nemo-icons')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e61b8d7a30536b92586f413ec1fddde42012d08be8b1a8a8f350adfcf407a59966e716b3e1d67b6d3ed0505973087245a0abefdd86b79a4a298143946e98bad8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # compile Python bytecode for modules outside of site-packages:
    python -m compileall -d / "${pkgdir}"/usr/share
    python -O -m compileall -d / "${pkgdir}"/usr/share
}
