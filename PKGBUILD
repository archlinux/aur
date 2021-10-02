# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-${_pkgname}"
pkgver=1.0.12
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-typing-extensions')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plinss/widlparser/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('e9d960a5bf521e5b44f7b0b0fc8cd7f67929386c65b88f0bb3e0db6d437967c9'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('cad375e8be42f4022f828df1fa9acf47a73ae2abb56da096ffb02875e8d93e11acff56691b9e763bb923cda2ae0e5f774eaa7ca20f4d7e6ebce83185f705c0af'
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
