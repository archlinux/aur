# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gst-plugin-viper4linux-git
_gitname=gst-plugin-viperfx
pkgver=r36.a5c1b03
pkgrel=2
pkgdesc="ViPER FX core wrapper plugin for gstreamer"
arch=('x86_64')
url="https://github.com/Audio4Linux/gst-plugin-viperfx"
license=('custom')
depends=('gst-plugins-base-libs' 'libviperfx')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}" 'gst-plugin-viperfx' 'libgstviperfx.so')
conflicts=("${pkgname%-git}" 'gst-plugin-viperfx' 'gst-plugin-jamesdsp')
source=('git+https://github.com/Audio4Linux/gst-plugin-viperfx.git')
sha256sums=('SKIP')

pkgver() {
  cd gst-plugin-viperfx
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S gst-plugin-viperfx \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  install -Dm755 build/libgstviperfx.so -t "$pkgdir/usr/lib/gstreamer-1.0/"

  cd gst-plugin-viperfx
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
