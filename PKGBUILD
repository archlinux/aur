# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=xfce4-zorinappgridlite-plugin-elite
pkgver=1.0.0
pkgrel=1
pkgdesc="Zorin AppGrid Lite plugin for the Xfce4 panel (with zorin-appgrid-lite dependency)[no error]"
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
depends=('gtk3' 'libxfce4ui' 'libxfce4util' 'xfce4-panel' 'zorin-appgrid-lite')
makedepends=('cmake' 'make' 'gcc' 'findutils')
source=(
    "http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/z/zorin-appgrid-lite/zorin-appgrid-lite_1.0.2.tar.xz"
    "http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/x/xfce4-zorinappgridlite-plugin/xfce4-zorinappgridlite-plugin_1.0.0.tar.xz"
)
sha256sums=('SKIP' 'SKIP')

build() {
    
    xfce4_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'xfce4-zorinappgridlite-plugin*' | head -n1)
    cd "$xfce4_dir"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make -j$(nproc)
}

package() {
    # Install zorin-appgrid-lite
    zorin_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'zorin-appgrid-lite*' | head -n1)
    cd "$zorin_dir"
    make DESTDIR="${pkgdir}/" install || true

    # Install xfce4-zorinappgridlite-plugin
    xfce4_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'xfce4-zorinappgridlite-plugin*' | head -n1)
    cd "$xfce4_dir"
    make DESTDIR="${pkgdir}/" install
}
