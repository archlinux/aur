# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons')
pkgver=2.0.1
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
sha512sums=('ff1ad823d3696a04e277ede409f1f6a80bc0df64d54d860115ba1509e24a7e356cfd1c63913820995e5500c4c1e4a5b1bc97d2be75c631e7ecdcdc5ad31f1883')

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
