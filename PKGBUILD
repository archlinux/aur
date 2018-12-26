# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=xmlcutty
pkgver=0.1.5
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
sha256sums=('df070332645e5cd2a80d63311d943aa0bd34c48cca7fa13eac425d559d14d84e')
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
