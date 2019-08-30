# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=xmlcutty
pkgver=0.1.6
pkgrel=1
pkgdesc='Select elements from large XML files, fast'
arch=('i686' 'x86_64')
url='https://github.com/miku/xmlcutty'
license=('GPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=("${pkgname}-bin")
replaces=("${pkgname}-bin")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2c7eb9fa4e70cae8d6df1982e6c7b98ed99236ca94abb3147bbb7f5984e9a329')
_gourl='github.com/miku/xmlcutty/cmd/xmlcutty'

prepare() {
  export GOPATH="${srcdir}"
  go get -fix -v -x ${_gourl}
}

check() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/${_gourl}/../.."
  make test
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
