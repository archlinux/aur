# Maintainer: Hao Long <aur@esd.cc>

pkgname=terminal-to-html
pkgver=3.16.5
pkgrel=1
pkgdesc="Converts arbitrary shell output (with ANSI) into beautifully rendered HTML"
arch=("x86_64" "i686")
url="https://github.com/buildkite/terminal-to-html"
license=('MIT')
provides=('terminal-to-html')
conflicts=('terminal-to-html')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('fc0796c15dbbe6148d0ff94b52250fc2ac5c73551c4b64186176850bbe36e69855c95424e153a677c553646e9a19816a2f34a2c181719be25c08c5a2dd44712a')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
