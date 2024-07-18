# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=go2rtc
pkgver=1.9.4
pkgrel=1
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
arch=('x86_64')
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e62ca900d1bb9b78708714276aaecf910cc8b2ad9cefc5f75cf8f82edfeb94bcbf449695a8853ffd8aac458587e9083f62722f76ee37f11306b7e1751f4deeae')
options=(!strip)
depends=('glibc')
makedepends=('go')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  install -D -m755 "${pkgname}-${pkgver}"/go2rtc "${pkgdir}/usr/bin/go2rtc"
}
