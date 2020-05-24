# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-caja-icons-py2')
_pypi_name=('git_caja_icons')
pkgver=1.1.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Caja extension to overlay icons on files in git repositories, Python 2 version"
depends=('git-nautilus-icons-common-py2' 'python2-caja')
makedepends=('python2-setuptools')
provides=('git-caja-icons-py2')
conflicts=('git-caja-icons-py2')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('fa15b2aae0cc6f7378b3c6c34e024f41ec49bb554f6711db29113d7f051f323ab3eedfd089bdad0a009f057c5ff11bf08184153dce727f4589b1de5b13f378db')

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
