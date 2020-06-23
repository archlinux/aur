# Maintainer: Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp
pkgver=0.1.3
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('any')
license=('AGPL')
makedepends=(go libolm)
optdepends=('ffmpeg: If you want to send gifs from Matrix'
            'libolm: If you want end-to-bridge encryption')
url="https://github.com/tulir/${pkgname}"
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('671ad744ec61e065ab5dabc6426eeebd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "example-config.yaml" "$pkgdir/usr/share/$pkgname/example-config.yaml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
