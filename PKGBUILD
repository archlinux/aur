# Maintainer: niyoko
pkgname=pipewire-visualizer
pkgver=0.2.0
pkgrel=1
pkgdesc='PipeWire Visualizer spectrum overlay for Wayland desktops'
arch=('x86_64')
url='https://github.com/niyoko/pipewire-visualizer'
license=('custom')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'fftw')
makedepends=('meson' 'ninja' 'pkgconf')
provides=('pwviz')
conflicts=('pwviz')
_tag='v0.2.0'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niyoko/pipewire-visualizer/releases/download/${_tag}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('60ce16b0dd72ed36d634d9e11ad88346b5d9b9061c3bcae4beef260d1c905c5c')

build() {
  meson setup build "${pkgname}-${pkgver}" \
    --prefix=/usr \
    --buildtype=plain \
    --wrap-mode=nodownload
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s pipewire-visualizer "$pkgdir/usr/bin/pwviz"
}
