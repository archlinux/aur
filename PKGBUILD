
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="tqm"
pkgver=1.5.0
pkgrel=1
pkgdesc="CLI tool to manage your torrent client queues. Primary focus is on removing torrents that meet specific criteria."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/l3uddz/tqm"
license=('GPL3')
makedepends=('go')
optdepends=(
  'deluge: torrent downloader'
  'qbittorrent: torrent downloader'
)

#backup=('etc/unpackerr/unpackerr.conf')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/l3uddz/tqm/archive/v${pkgver}.tar.gz"
)

sha512sums=('4406ac9a435ec4e960962e4d36a662a08b7a28b5e1a1f50dcfa229438a11dd088203e37c78f17394529993bfa64773b56d7d52b25d1a07d6debfc344ecd1fa87')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o tqm
}

package() {
  # Install the binary
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/tqm" "${pkgdir}/usr/bin/tqm"
}
