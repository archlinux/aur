# Maintainer: Panagiotis Mavrogiorgos <pmav99 at gmail dot com>

pkgbase=python-pipx
pkgname=python-pipx
_name=pipx
pkgver=0.14.0.0
pkgrel=2
pkgdesc='Execute binaries from Python packages in isolated environments'
arch=('any')
url='https://github.com/cs01/pipx/'
license=('MIT')
depends=('python-userpath' 'python-argcomplete')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/cs01/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('38bec26099535a9bd84e5a7d4a30753b2ebdcbbd8c33179d62eb5fc1c09ff816122ee672dfc5c191cad6ffb5496d0fe9fc825ddec7f689758f1c9a34f53270e4')

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

