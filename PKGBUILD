# Maintainer: niyoko
pkgname=pipewire-visualizer
pkgver=0.5.2
pkgrel=1
pkgdesc='PipeWire Visualizer spectrum overlay for Wayland desktops'
arch=('x86_64')
url='https://github.com/niyoko/pipewire-visualizer'
license=('custom')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'fftw' 'json-glib' 'libsoup3')
makedepends=('meson' 'ninja' 'pkgconf')
provides=('pwviz')
conflicts=('pwviz')
_tag='v0.5.2'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niyoko/pipewire-visualizer/releases/download/${_tag}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f95398f9dee095e73e130660332d13ad8294076182b4cbc95f0be289d16714b')

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
