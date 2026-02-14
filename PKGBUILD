# Maintainer: EightySix mail@eightysixk.org

pkgname=gpu-control
pkgver=1.0.0
pkgrel=1
pkgdesc='nvidia gpu control software.'
arch=('x86_64')
url='https://github.com/EightySixK/GPU-Control'
license=('MIT')
depends=('qt5-base' 'nvidia-utils' 'nvidia-settings')
makedepends=('cmake' 'gcc' 'make')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "GPU-Control-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make -j$(nproc)
}

package() {
    cd "GPU-Control-$pkgver"

    install -Dm755 build/gpu-control "$pkgdir/usr/bin/gpu-control"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/gpu-control.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=GPU Control
Comment=NVIDIA GPU Power and Clock Control
Exec=/usr/bin/gpu-control
Icon=nvidia-settings
Terminal=false
Categories=System;Settings;
EOF
}
