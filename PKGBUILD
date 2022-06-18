# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-${_pkgname}"
pkgver=1.1.1
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-typing-extensions')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plinss/widlparser/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('2c51022f4bbb8cbc686505eb14736402e4b48802f059329560223e20157fc950'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('d6e4a215492ae017c29f26c3ff61f903986088911a0f4791e825dec4c90ca6f510f1d7a20d518899688001c343d832d91de31e8424dfdecf950b5c7783562e8e'
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
