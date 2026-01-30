# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=doas-sudo-shim
pkgname=${_pkgname}-git
pkgver=0.1.2.r1.g6833c8d
pkgrel=2
pkgdesc="Sudo wrapper which wields doas (Original upstream by Jakub Jirutka)"
arch=('any')
url="https://github.com/jirutka/${_pkgname}"
license=('ISC')
depends=('doas')
makedepends=('git' 'asciidoctor')
provides=('sudo' "${_pkgname}")
conflicts=('sudo' "${_pkgname}" 'doas-sudo-shim-k')
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make man
}

package() {
  cd "${_pkgname}"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
