# Maintainer: taoky <me@taoky.moe>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Jonathan Chasteen <jonathan dot chasteen at live dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: aimileus <me at aimileus dot nl>
# (Modified from qgnomeplatform-qt6-git's PKGBUILD)

pkgbase=qadwaitadecorations-git
_pkgname=QAdwaitaDecorations
pkgname=(qadwaitadecorations-qt5-git qadwaitadecorations-qt6-git)
pkgver=0.1.3.r0.g795bd8d
pkgrel=1
pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=(x86_64)
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1)
makedepends=(cmake git)
depends=(qt5-svg qt5-wayland qt6-svg qt6-wayland)
source=(git+https://github.com/FedoraQt/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt5 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_qadwaitadecorations-qt5-git() {
  pkgdesc='Qt5 decoration plugin implementing Adwaita-like client-side decorations'
  provides=(qadwaitadecorations-qt5)
  conflicts=(qadwaitadecorations-qt5 qgnomeplatform-qt5)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_qadwaitadecorations-qt6-git() {
  pkgdesc='Qt6 decoration plugin implementing Adwaita-like client-side decorations'
  provides=(qadwaitadecorations-qt6)
  conflicts=(qadwaitadecorations-qt6 qgnomeplatform-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}

