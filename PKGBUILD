# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=sshconfig
pkgname="python-${_pkgname}"
pkgver=2.1.0
pkgrel=1
pkgdesc="SSH config file generator"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('GPL3')
depends=('python'
         'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KenKundert/sshconfig/archive/v${pkgver%.*}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/KenKundert/sshconfig/releases/download/v${pkgver%.*}/sshconfig-${pkgver%.*}.tar.gz.asc")
sha256sums=('6a4594008e1a2e335884011d98e8eea53fc3127ab6960b97bfca242bdef35486'
            'SKIP')
b2sums=('7fd3ebee3cf87d9d1a4ed034b93ca4fc9c859aafd0136bf68001b2d6cf86559eb2e133fd0e039ca1f999018cc1f0a8c582737077ff1f3773d06a1ae1cfe91536'
        'SKIP')
validpgpkeys=(
  '4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50' # Kenneth Scott Kundert <ken@designers-guide.com>
)

build() {
  cd "${_pkgname//-/_}-${pkgver%.*}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver%.*}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
