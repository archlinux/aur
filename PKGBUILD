# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons')
pkgver=2.0.3
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
sha512sums=('838d48f3bde4ef7df5804e5560d00783c7418ac1c9fe1c337b03f3b1cf38a17588cfce12c79e4523ea9f384155ad72513dc2855c4a830c2020c29452df093477')

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
