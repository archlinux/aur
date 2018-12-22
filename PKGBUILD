# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=autovpn
pkgname=${_pkgname}-git
pkgver=17.4e19a80
pkgrel=1
pkgdesc='Easily connect to a VPN in a country of your choice.'
arch=('x86_64')
url='https://github.com/adtac/autovpn'
license=('GPL3')
depends=('openvpn')
makedepends=('git' 'go-pie')
conflicts=('autovpn')
provides=('autovpn')
options=('!strip' '!emptydirs')
source=('git+https://github.com/adtac/autovpn.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  go build -o ${_pkgname}
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" README.md
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
