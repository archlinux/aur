# Maintainer: aquova <mail at aquova dot net>

pkgname="geargrafx"
pkgver=1.7.0
pkgrel=1
pkgdesc="PC Engine / TurboGrafx-16 emulator and debugger"
url="https://github.com/drhelius/Geargrafx"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "geargrafx.desktop"
)
sha256sums=(
    "7a316edfacbf4cea39870b2fdf502ce789e687b86e873c1e1cacb05b623af7a7"
    "14e9061980e38d4fb8d42b559a640f4a65352269f56751c55eeff1fa1e8fd3bd"
)

build() {
    cd $srcdir/Geargrafx-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Geargrafx-${pkgver}/platforms
    mkdir -p $pkgdir/opt/geargrafx
    install -Dm755 linux/geargrafx $pkgdir/opt/geargrafx
    install -Dm644 shared/gamecontrollerdb.txt $pkgdir/opt/geargrafx
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/geargrafx/geargrafx $pkgdir/usr/bin/geargrafx
    install -Dm644 $srcdir/geargrafx.desktop $pkgdir/usr/share/applications/geargrafx.desktop
}
