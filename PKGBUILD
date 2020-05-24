# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons-py2')
_pypi_name=('git_nautilus_icons')
pkgver=1.1.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Nautilus extension to overlay icons on files in git repositories, Python 2 version"
depends=('git-nautilus-icons-common-py2' 'python2-nautilus')
makedepends=('python2-setuptools')
provides=('git-nautilus-icons-py2')
conflicts=('git-nautilus-icons' 'git-nautilus-icons-py2')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('e03796f9589a3fe9bd6ed9c3634a8a5a7070a6d11a331cade7f97429e21de9a4385b92922c6253699c70b38458ebe932a99f8b99b7d4f44a923e4282ff0f15f7')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # compile Python bytecode for modules outside of site-packages:
    python2 -m compileall -d / "${pkgdir}"/usr/{lib,share}
    python2 -O -m compileall -d / "${pkgdir}"/usr/{lib,share}
}
