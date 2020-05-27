# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.15.4.0
pkgrel=1
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT')
depends=('python-setuptools' 'python-userpath' 'python-argcomplete')
makedepends=()
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/pipxproject/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('bfb8269a725e88cb6209ba6c6f555a3750c0e23ce719b1e5c7e6a07f4e8ffbb139b3ddfbff30cd39abfe6e8a87e886bc2b13faa5fcc313892a4247e4ae840f3b')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  #  export PYTHONPATH=build:${PYTHONPATH}
  #  py.test
  #python setup.py test
  # handle userpath
  echo 'You need to append ~/.local/bin to $PATH (if necessary)'
  echo 'You can do so with: userpath append ~/.local/bin/'
}

package_python-pipx() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # docs
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

