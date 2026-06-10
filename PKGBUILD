# Maintainer: Mikołaj Mikołajczyk <mikolajczyk.mikolajm@gmail.com>
pkgname=radboard-bin
pkgver=0.8.3
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
sha256sums=('656c7ee06566ba1704fd8e1ec4b593788549d6384c8109c4c8665b108589ed72')

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
