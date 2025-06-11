# Maintainer: Chris Sutcliff <chris at sutcliff dot me>
# Contributor: Martin Andersson <m.t.andersson at gmail dot com>

pkgname="gphotos-uploader-cli"
pkgver="5.1.0"
pkgrel=0
pkgdesc='Command line tool to mass upload media folders to your Google Photos account(s).'

url="https://github.com/gphotosuploader/gphotos-uploader-cli"
arch=('x86_64')
license=('MIT')

makedepends=(
  'go'
)

depends=()

source=(
 "https://github.com/gphotosuploader/gphotos-uploader-cli/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('180ced2507d796b2305627097017aacd2b0206e1131e0b40da2a46563a823ec1')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" \
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
}
