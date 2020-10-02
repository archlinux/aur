# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=xmonad-log
pkgver=0.1.0
pkgrel=3
pkgdesc="DBus monitor for xmonad log events"
arch=('x86_64' 'i686')
url="https://github.com/xintron/xmonad-log"
license=('MIT')
makedepends=('go' 'golang-github-godbus-dbus')
options=('!strip' '!emptydirs')
source=("https://github.com/xintron/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b08ca8db87c0418819f6f0c546fe18da336adbc9d0b3e95205bb2690095d6dd4')

build() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="/usr/share/gocode:/usr/lib/go"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GO111MODULE='off'

  go build -trimpath -buildmode=pie \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o bin/${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
