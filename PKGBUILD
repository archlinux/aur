# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=webhook
pkgver=2.6.8
pkgrel=1
pkgdesc="Small server for creating HTTP endpoints (hooks)"
arch=('i686' 'x86_64' 'arm' 'armv6' 'armv7' 'aarch64')
license=('MIT')
url="https://github.com/adnanh/webhook"
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/adnanh/webhook/archive/${pkgver}.tar.gz" 'go.uuid.patch')
sha1sums=('e050562130f4f101bbd7281dbe875d4493b31674'
          '1312834f40da2109cd47514a74aaf1349db918a3')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p2 < "${srcdir}/go.uuid.patch"
  GOPATH=$(pwd) go get -d -v
}

build() {
  cd "${pkgname}-${pkgver}"

  GOPATH=$(pwd) go build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
