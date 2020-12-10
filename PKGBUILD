# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-${_pkgname}"
pkgver=1.0.6
pkgrel=2
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-typing-extensions')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plinss/widlparser/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('90ef5a06decce85db33c103109fe2e25b2f472a75479cddfd0cfc7c139bd1a88'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('1d53f4d815a0e6a4517c3a709f06bec537977536f1366d0f1a225db9a4be84c3a4d3cfdfa9f9dca487126dabf330e096b50604956eb5e2533fc5f5af3c438744'
        '9869a2d862cc7ea22788323384983b8afe64f0015bfae28181d60b0601e2e4c67e74774a4e318842873eef418eb887bfa0f58ef6cca59278f52d95433a2c79a4')

prepare() {
  cd "${_pkgname//-/_}-${pkgver}"

  sed -i s/version=.*/version=\'${pkgver}\',/ setup.py
}

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
