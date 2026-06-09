# Maintainer: Mikołaj Mikołajczyk <mikolajczyk.mikolajm@gmail.com>
pkgname=radboard-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Desktop Kanban board for Radicle"
arch=('x86_64')
url="https://radboard.mikolajczyk.org"
license=('MIT')
provides=('radboard')
conflicts=('radboard')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'openssl')
options=('!strip' '!debug')
source=("radboard-${pkgver}.deb::https://dl.mikolajczyk.org/radboard/v${pkgver}/radboard-amd64.deb")
sha256sums=('a0a2b9ddc1429fe2e33f1ec56226959b1f4f3caa4f53ed90003c155894ee0a00')

prepare() {
    cd "$srcdir"
    bsdtar -xf "radboard-${pkgver}.deb"
    if [ -f data.tar.zst ]; then
        bsdtar -xf data.tar.zst
    elif [ -f data.tar.xz ]; then
        bsdtar -xf data.tar.xz
    else
        bsdtar -xf data.tar.gz
    fi
}

package() {
    cd "$srcdir"
    cp -a usr "$pkgdir/"
}
