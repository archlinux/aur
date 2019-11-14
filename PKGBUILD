# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons')
_pypi_name=('git_nautilus_icons')
pkgver=1.1.1
pkgrel=2
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
pkgdesc="A Nautilus extension to overlay icons on files in git repositories"
depends=('git-nautilus-icons-common' 'python-nautilus')
makedepends=('python-setuptools')
provides=('git-nautilus-icons')
conflicts=('git-nautilus-icons' 'git-nautilus-icons-py2')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha512sums=('528d915aa2c94dde3b56f9b697434ec9808d72530cc232c34aae8c970fb611be86e1a4ad4ebddbce65af4d5d99e5e8e17e9e42bb5dfafb6f976496e43da1e4bd')

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
