# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='pipdeptree'
pkgver=2.1.0
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
url="https://github.com/naiquevin/${pkgname}"
depends=('python-pip')
optdepends=('graphviz: for generating graphical output')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0edf5e0d11d26c3960884839ac6fbe72eabf6f3bf3c76e495414d3aae693f9a2')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1
  # install documentation
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
