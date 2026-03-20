# Maintainer: Dagmawi Ali <xdagiz at protonmail dot com>
# Contributor: Dagmawi Ali <xdagiz at protonmail dot com>

pkgname='xytz'
pkgver=0.8.7
pkgrel=1
pkgdesc='a beautiful TUI YouTube Downloader'
url='https://github.com/xdagiz/xytz'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('xytz')
conflicts=('xytz-bin')
depends=('yt-dlp' 'ffmpeg')
makedepends=('go' 'git')
optdepends=('mpv: for playing videos')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/xdagiz/xytz/releases/download/v0.8.7/xytz_0.8.7.tar.gz")
sha256sums=('f12c6c8f9c6c637eed2fd95a028c002e903f362aee2f2b959b885c4a7f07a373')

build() {
  cd "${pkgname}_${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-w -s -buildid='' -linkmode=external -X github.com/xdagiz/xytz/internal/version.Version=${pkgver}" -o xytz .
}

package() {
  cd "${pkgname}_${pkgver}"
  install -Dsm755 ./xytz "${pkgdir}/usr/bin/xytz"
  install -Dsm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
