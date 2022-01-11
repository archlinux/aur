# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=jack-example-tools-git
pkgver=r647.fc9e9c4
pkgrel=1
pkgdesc="Official JACK example clients and tools"
arch=(x86_64)
url="https://github.com/jackaudio/jack-example-tools"
license=(GPL2 GPL3)
depends=(glibc opus)
makedepends=(alsa-lib git jack libsamplerate libsndfile meson readline
zita-alsa-pcmi zita-resampler)
provides=(jack-example-tools)
conflicts=(jack-example-tools)
source=("$pkgname::git+https://github.com/jackaudio/jack-example-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson build "$pkgname"
  ninja -vC build
}

package() {
  depends+=(libasound.so libjack.so libsamplerate.so libsndfile.so
  libreadline.so libzita-alsa-pcmi.so libzita-resampler.so)

  DESTDIR="$pkgdir" meson install -C build
}
