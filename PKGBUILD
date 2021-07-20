# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=gonano
pkgver=0.1.16
pkgrel=4
_pkgdate=1622827223
pkgdesc='Go language support for NANO — a digital currency'
arch=('x86_64' 'armv7h')
url='https://github.com/hectorchu/gonano'
license=('MIT')
depends=('ocl-icd')
makedepends=('go')
provides=('gonano')
conflicts=('gonano')
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
md5sums=(
  '896636adcf8633f66c07f1b31eed8012'
)
sha1sums=(
  'acef27d018b2f9b08f667670e3f05d04cf57433c'
)
sha256sums=(
  '6f6d5a9ad0782d39bb7aae6f933d1b983ae595e0e05714648e79de13502a3718'
)
sha512sums=(
  'c0b39ef411d163ab80fde673cc19df72d84041d3583c5b18704aa2c6707811999cc2d4ba3bf1796c4f6bdf80a8fa5b97ab1e848971fb4c76fd58832f83f5c773'
)
b2sums=(
  'a555804b1053137d84b053c86e38b24f93dba22b3f2721a50747971ac29c4146cd1c013b4c6f5911f8183de27a51421eff3dab45ee1556b351b9ff0781143c37'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.date=$_pkgdate" \
    -mod=readonly \
    -modcacherw \
    .
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 gonano    "$pkgdir/usr/bin/gonano"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
