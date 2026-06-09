# Maintainer: Mikołaj Mikołajczyk <mikolajczyk.mikolajm@gmail.com>
pkgname=radboard-bin
pkgver=0.8.0
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
sha256sums=('439cc7160469981fdb4d26839c261d12980eaf134ce9400a08e3f63b4d1ee5bb')

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
