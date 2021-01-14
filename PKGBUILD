# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=sshconfig
pkgname="python-${_pkgname}"
pkgver=2.0.0
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
sha256sums=('c3a554db38ba82c7c739a214dd766d28e4739eb5c190abf986508165b177d23d'
            'SKIP')
b2sums=('7a1304cb21eb8bd8675579407294077cb2ec6dc2d99370e3cda77f4eb4e589f08b0b4ae2582076cea9f0d5e5651b78894ee34216673dc5fd5d1b1cad36dcaed1'
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
