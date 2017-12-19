# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=fritzctl
pkgver=1.4.18
pkgrel=1
pkgdesc="A lightweight, easy to use console client for the AVM FRITZ!Box Home Automation."
arch=('x86_64')
url="https://github.com/bpicode/fritzctl"
license=('MIT')
makedepends=('go')
options=('!strip')
source=("https://github.com/bpicode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('97d1239eaac38de3f226704374f8384a7c3335a3ad4a1a21b44a8ee213f4847e')

prepare() {
  mkdir -p "${srcdir}/src/github.com/bpicode/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/bpicode/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/bpicode/${pkgname}"
  GOPATH="${srcdir}" go build
}

package() {
  cd "${srcdir}/src/github.com/bpicode/${pkgname}"

  mkdir -p "$pkgdir/etc/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
