# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_commitref='d10ff033ec7ef8bda7a76f43b7ee82875c7c9782'

_pkgname=criticality-score
pkgname="python-${_pkgname}"
pkgver=1.0.5
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ossf/criticality_score/${_commitref}/LICENSE")
sha256sums=('94db501e70be608d4e359440e56f6246ebca874d28c2ce5f0f280eb955eb8929'
            '669649bdd4097a659e5e952b2bcaafc4693c5124e399adc2522dbc7e5865ab26')
b2sums=('8232cdb86dfdfbead168ff1c178a435b0dca8433e1cafe74ce1c7c27a0ae2f156c065096b16e04283d73b68fed2d2770afa150461cb450d25e6ef80c2ed66251'
        '9d6391e0d3fdcd9c5587893f27c9ddd2a817260ff8dfe685c137ba97ac514029d1a1babd20bed5ea057161c819aed7503eb155d984c4fa9669b81b38cfc96408')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  find "${pkgdir}/usr/lib/python"*"/site-packages" -type f -exec chmod 0644 {} \;

  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
