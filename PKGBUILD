# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=xmlcutty
pkgver=0.1.8
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
sha256sums=('d6a0bfc183eed0c09765c4bf5d96293078fbd33553b02d4f0af876d3d50cacd0')
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
