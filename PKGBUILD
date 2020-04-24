# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.15.1.3
pkgrel=2
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT')
depends=('python-setuptools' 'python-userpath' 'python-argcomplete')
makedepends=()
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/cs01/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('fc05089a4a84fcd15a6a470c77a586bbae28286388892e45a981e3e4fd58f6a78d897b82f985bc0f7d3d9f29f89bd1ec9927bbf0a45de4b6a1532c9a62c63c32')


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

