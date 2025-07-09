# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=xfce4-zorinmenulite-plugin-elite
pkgver=1.1.4
pkgrel=4
pkgdesc="Zorin Menu Lite plugin for the Xfce4 panel[no error]"
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
depends=('gtk3' 'libxfce4ui' 'libxfce4util' 'xfce4-panel')
makedepends=('cmake' 'make' 'gcc' 'findutils')
source=(
    "http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/x/xfce4-zorinmenulite-plugin/xfce4-zorinmenulite-plugin_${pkgver}.tar.xz"
)
sha256sums=('SKIP')

prepare() {
    
    src_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'xfce4-zorinmenulite-plugin*' | head -n1)
    cd "$src_dir"

    
    sed -i 's/cmake_minimum_required(VERSION [0-9.]\+)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
}

build() {
    src_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'xfce4-zorinmenulite-plugin*' | head -n1)
    cd "$src_dir"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make -j$(nproc)
}

package() {
    src_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'xfce4-zorinmenulite-plugin*' | head -n1)
    cd "$src_dir"

    make DESTDIR="${pkgdir}/" install
}
