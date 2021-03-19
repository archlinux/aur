
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="tqm"
pkgver=1.4.2
pkgrel=1
pkgdesc="CLI tool to manage your torrent client queues. Primary focus is on removing torrents that meet specific criteria."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/l3uddz/tqm"
license=('GPL3')
depends=('go')
optdepends=(
  'deluge: torrent downloader'
  'qbittorrent: torrent downloader'
)

#backup=('etc/unpackerr/unpackerr.conf')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/l3uddz/tqm/archive/v${pkgver}.tar.gz"
)

sha512sums=('838ae37b75b8f2a47b0d4b95c8981ad6bd27aec79b4d61dc071e014ed1a606e77ae2bb987dec4289c1dc93584b5b1529d9b27d10a09e3a9633adf2c8f776a91d')

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
