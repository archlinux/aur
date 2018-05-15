# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=fritzctl
pkgver=1.4.22
pkgrel=1
pkgdesc="A lightweight, easy to use console client for the AVM FRITZ!Box Home Automation."
arch=('x86_64')
url="https://github.com/bpicode/fritzctl"
license=('MIT')
makedepends=('go')
options=('!strip')
source=("https://github.com/bpicode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ffd5de2d6580fa482f64bc7803bfcfd9ec7c13a68b33648c5bfd1edc718e0c10')

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
