# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_commitref='d10ff033ec7ef8bda7a76f43b7ee82875c7c9782'

_pkgname=criticality-score
pkgname="python-${_pkgname}"
pkgver=1.0.3
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ossf/criticality_score/${_commitref}/LICENSE")
sha256sums=('8e6c983460831a76ae4e003444c9d7a399cbf3304ae453a92f22863cde3becf6'
            '669649bdd4097a659e5e952b2bcaafc4693c5124e399adc2522dbc7e5865ab26')
b2sums=('ba1ca10bb088bce7e5b121e63aed344f58dac929afeb56feead18e8590bec7de9f22cf7b7e6619c71b3daeebb083d272ac9be2da9020908e307449a86f86a8d7'
        '9d6391e0d3fdcd9c5587893f27c9ddd2a817260ff8dfe685c137ba97ac514029d1a1babd20bed5ea057161c819aed7503eb155d984c4fa9669b81b38cfc96408')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
