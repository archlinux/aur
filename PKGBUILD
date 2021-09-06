# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-${_pkgname}"
pkgver=1.0.11
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-typing-extensions')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plinss/widlparser/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('21365e74d35e67609748875e77d8c75a7f2200ceeba452c65cdb247c7056a758'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('05379d2be45da5151b6abb7699d9de1c241058df52b950671712cdbadd51dba0b4e742ce5ecbc284867cd4c7af90ff2b35d51d4967eb0e276f4d4ccd77adc986'
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
