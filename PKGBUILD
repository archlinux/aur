# Maintainer: niyoko
pkgname=pipewire-visualizer
pkgver=0.5.0
pkgrel=1
pkgdesc='PipeWire Visualizer spectrum overlay for Wayland desktops'
arch=('x86_64')
url='https://github.com/niyoko/pipewire-visualizer'
license=('custom')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'fftw' 'json-glib' 'libsoup3')
makedepends=('meson' 'ninja' 'pkgconf')
provides=('pwviz')
conflicts=('pwviz')
_tag='v0.5.0'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niyoko/pipewire-visualizer/releases/download/${_tag}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('67eed7ff14946ec00a7febc4d3bcc15b2aa28ae0f56a59268c515e65153d470d')

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
