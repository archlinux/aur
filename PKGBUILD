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
pkgname=(qadwaitadecorations-qt6-git)
pkgver=0.1.0.r0.g8ef4b78
pkgrel=1
pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=(x86_64)
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1)
makedepends=(cmake git qt6-wayland)
source=(git+https://github.com/FedoraQt/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt6 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_qadwaitadecorations-qt6-git() {
  pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt6-wayland)
  provides=(qadwaitadecorations-qt6)
  conflicts=(qadwaitadecorations-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}

