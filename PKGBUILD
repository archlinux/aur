# Maintainer:  Peter Mattern <pmattern at arcor dot de>
# Contributor: Koscheev "Ashen" Mikhail <fresh19991 at yandex dot ru>
# Contributor: Pascal "hardfalcon" Ernster <aur at hardfalcon dot net>
# Contributor: Marcel Dykstra <marcel dot dykstra at gmail dot com>

_pkgname=xf86-video-openchrome
pkgname=$_pkgname-git
pkgver=0.3.3.43.g47060a3
pkgrel=1
pkgdesc="Open Source X driver for VIA IGPs"
arch=("i686" "x86_64")
url="http://www.freedesktop.org/wiki/Openchrome"
license=("MIT")
depends=("libdrm" "libxvmc" "xorg-server")
optdepends=("unichrome-dri")
makedepends=("git" "xorg-server-devel" "X-ABI-VIDEODRV_VERSION=19")
provides=("$_pkgname")
conflicts=("$_pkgname" "X-ABI-VIDEODRV_VERSION<19" "X-ABI-VIDEODRV_VERSION>=20")
source=("git://anongit.freedesktop.org/openchrome/$_pkgname")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/release_//;s/_/./g;s/-/./g"
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
