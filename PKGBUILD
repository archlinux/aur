# Maintainer: Vee Satayamas <veerpub@pm.me>

pkgname='processor-info'
pkgver=0.0.1
pkgrel=1
pkgdesc='A small GUI app showing CPU frequencies, model names, temperature, etc.'
arch=('any')
license=('GPL-3.0-or-later')
url='https://codeberg.org/veer66/processor_info'
source=("https://codeberg.org/veer66/processor_info/archive/v$pkgver.tar.gz")
sha256sums=('427ab70859551b72a594f2896cfdfd74cd1d08acffd3f09038a34c2e8f448a22')
depends=(
    lm_sensors
    procps-ng
    tk
    util-linux
)

package() {
    cd processor_info
    mkdir -p "$pkgdir/usr/share/processor-info"
    install -Dm644 -t "$pkgdir/usr/share/processor-info" *.tcl
    mkdir -p "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/processor-info"
#!/bin/sh

wish /usr/share/processor-info/processor_info.tcl
EOF
    chmod 0755 $pkgdir/usr/bin/processor-info
}
