# Maintainer: F_TD5X <mjikop1231@gmail.com> 
pkgname=rkrga-git
pkgver=2024.08.07
pkgrel=1
pkgdesc="Rockchip Graphics Accelerator"
arch=('aarch64')
url="https://github.com/nyanmisaka/rk-mirrors"
license=('Apache-2.0' 'GPL3')
depends=('libdrm')
makedepends=('meson' 'ninja')

source=($pkgname-$pkgver.tar.gz::https://github.com/nyanmisaka/rk-mirrors/archive/refs/heads/jellyfin-rga.zip)
sha256sums=('1cce22778d3d74bf51ad9b06dc27e6fcee24c2e2fd3de609abaa6f722597f647')

build() {
  cd "$srcdir"
  meson setup rk-mirrors-jellyfin-rga build --prefix=/usr --libdir=lib --buildtype=release --default-library=shared -Dcpp_args=-fpermissive -Dlibdrm=false -Dlibrga_demo=false
  meson configure build
  ninja -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}

