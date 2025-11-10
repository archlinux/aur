# Maintainer: acd407 <acd407@qq.com>
# Contributor: taoky <me@taoky.moe>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# (Modified from qadwaitadecorations-qt6-git's PKGBUILD)

pkgname=qadwaitadecorations-colorful-qt6-git
_pkgname=QAdwaitaColorfulDecorations
pkgver=v0.0.1.r2.g7ba31cf
pkgrel=1
pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations with config support'
arch=(x86_64)
url='https://github.com/acd407/QAdwaitaColorfulDecorations'
license=(LGPL-2.1-or-later)
makedepends=(cmake git)
depends=(qt6-wayland qt6-svg)
provides=(qadwaitadecorations-qt6)
conflicts=(qadwaitadecorations-qt6 qgnomeplatform-qt6)
source=(git+https://github.com/acd407/QAdwaitaColorfulDecorations.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
