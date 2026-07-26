# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=doas-sudo-shim
pkgname=${_pkgname}-git
pkgver=0.2.0.r0.gefd3413
pkgrel=1
pkgdesc="Sudo wrapper which wields doas"
arch=('any')
url="https://github.com/jirutka/${_pkgname}"
license=('ISC')
depends=('opendoas')
makedepends=('git' 'asciidoctor')
provides=('sudo' "${_pkgname}")
conflicts=('sudo' "${_pkgname}")
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
