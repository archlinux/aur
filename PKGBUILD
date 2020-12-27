# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_commitref='d10ff033ec7ef8bda7a76f43b7ee82875c7c9782'

_pkgname=criticality-score
pkgname="python-${_pkgname}"
pkgver=1.0.6
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ossf/criticality_score/${_commitref}/LICENSE")
sha256sums=('50e25ab34179afcc28a5e6e14741abe4508e313503e3e3a9d05507027af5b0bf'
            '669649bdd4097a659e5e952b2bcaafc4693c5124e399adc2522dbc7e5865ab26')
b2sums=('7b53ae5690dd274a7362aeadf321fdb12c850be4a538f624591d513d33d44685471d74da09ae28ac345afb899f114995938c30de408591d89afff6b729d0b653'
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
