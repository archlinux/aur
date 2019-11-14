# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nemo-icons')
_pypi_name=('git_nemo_icons')
pkgver=1.1.1
pkgrel=2
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Nemo extension to overlay icons on files in git repositories"
depends=('git-nautilus-icons-common' 'nemo-python')
makedepends=('python-setuptools')
provides=('git-nemo-icons')
conflicts=('git-nemo-icons')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('295da5cd2bc7a8a42dbf9f34d1b8ff40f0e78a01c3b0ada9e37a9da705169694763f71136ffdb6c724512214577a67af338ff86413951974301623c5f17b4a48')

build() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pypi_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # compile Python bytecode for modules outside of site-packages:
    python -m compileall -d / "${pkgdir}"/usr/{lib,share}
    python -O -m compileall -d / "${pkgdir}"/usr/{lib,share}
}
