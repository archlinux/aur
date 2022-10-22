# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=1.4.0
pkgrel=2
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('x86_64' 'aarch64')
url="https://darkman.whynothugo.nl/"
license=('ISC')
depends=('geoclue')
makedepends=('go' 'git' 'scdoc')
source=("git+https://gitlab.com/WhyNotHugo/darkman.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')
validpgpkeys=("1204CA9FC2FFADEEDC2961367880733B9D062837")

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
}
