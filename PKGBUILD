# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=fritzctl
pkgver=1.4.23
pkgrel=1
pkgdesc="A lightweight, easy to use console client for the AVM FRITZ!Box Home Automation."
arch=('x86_64')
url="https://github.com/bpicode/fritzctl"
license=('MIT')
makedepends=('go')
options=('!strip')
source=("https://github.com/bpicode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('63bd37113146bb75b3ba1aff10b9a1fe34e7e8d684ed0b624c97b0cd03e26830')

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
