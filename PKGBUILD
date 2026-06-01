# Maintainer: niyoko
pkgname=pipewire-visualizer
pkgver=0.4.2
pkgrel=1
pkgdesc='PipeWire Visualizer spectrum overlay for Wayland desktops'
arch=('x86_64')
url='https://github.com/niyoko/pipewire-visualizer'
license=('custom')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'fftw' 'json-glib' 'libsoup3')
makedepends=('meson' 'ninja' 'pkgconf')
provides=('pwviz')
conflicts=('pwviz')
_tag='v0.4.2'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niyoko/pipewire-visualizer/releases/download/${_tag}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8f51afb781265c198e05bdd94551d9bb2ebf87563d258aaf7a26a58f94ea0bb5')

build() {
  meson setup build "${pkgname}-${pkgver}" \
    --prefix=/usr \
    --buildtype=release \
    -Db_lto=true \
    -Dnative_cpu=true \
    --wrap-mode=nodownload
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s pipewire-visualizer "$pkgdir/usr/bin/pwviz"
}
