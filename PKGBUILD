# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nemo-icons')
_pypi_name=('git_nemo_icons')
pkgver=1.1.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Nemo extension to overlay icons on files in git repositories"
depends=('git-nautilus-icons-common' 'nemo-python')
makedepends=('python-setuptools')
provides=('git-nemo-icons')
conflicts=('git-nemo-icons')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('c38e1971db8a68c8ed5afe89551d00eb86c6a29fcda404aa923ad41625017b41462ced3cb2a38fe4c7a10d87484f6c24a44270d73973e3bb78f5ee4f2846db22')

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
