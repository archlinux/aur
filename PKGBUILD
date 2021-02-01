# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=rtoml
pkgname="python-${_pkgname}"
pkgver=0.5.0
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz")
sha256sums=('ba3760bee5cb5afb12de630e3883f609db177d3311e71e6ac492f2a199c70e97')
b2sums=('4bc736f2a0a001715271fbce9102c8c5c3e3d57541868228b4f624cfb59931ebe1dfff3abd63cffac77d39fb4406fa903095b451c82ac429f5486c3ab2a7d8e1')

check() {
  cd "${_pkgname/-/_}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
