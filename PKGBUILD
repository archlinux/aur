# Maintainer: Marcin Kocur <marcin2006@gmail.com>
pkgname="audio_async_loopback-git"
pkgver=r7.75b8c97
pkgrel=1
pkgdesc="Real-time S/PDIF PCM/AC3 capture and playback"
arch=('x86_64')
url="https://github.com/jakemoroni/audio_async_loopback"
license=('GPL3')
depends=(libsamplerate libpulse ffmpeg)
makedepends=(gcc git)
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  gcc -o audio_async_loopback main.c iec_61937.c pcm_sink.c ac3_sink.c -lpulse-simple -lsamplerate -lpthread -lavutil -lavcodec -Wall -O3 -flto
  echo "${srcdir}"
  echo "${pkgname%-git}"
  echo "${pkgdir}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/audio_async_loopback" "${pkgdir}/usr/bin/audio_async_loopback"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-git}/README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
