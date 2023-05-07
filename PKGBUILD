# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons')
pkgver=2.1.0
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
sha512sums=('369a38db9e7abf38ece6ef1d244d0728320a3bca5790b6a6908859104f0bb3578925dc9227e2d1f728171d259de05ce0c0cbd37bd2804183adc52fabc2ae39d2')

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
