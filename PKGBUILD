# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-caja-icons-py2')
_pypi_name=('git_caja_icons')
pkgver=1.1.1
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
sha512sums=('3d3856447edc1fd20dddbb75cafe18aa1eda06fa491ea7b520b425cedcb5fccdf1f6e2322b51214d817492b667e2204fed6a88c5a952b258478fbb7bed7d7f79')

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
