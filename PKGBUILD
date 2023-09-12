# Maintainer: coolingtool <coolingtool-backup@outlook.com>

pkgbase=qadwaitadecorations
_pkgname=QAdwaitaDecorations
pkgname=(qadwaitadecorations-qt5 qadwaitadecorations-qt6)
pkgver=0.1.1
pkgrel=1
pkgdesc=' Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=('x86_64')
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1)
makedepends=(make cmake qt5-wayland-decorations qt6-wayland qt5-svg qt6-svg)
conflicts=('qadwaitadecorations-git')
source=(https://github.com/FedoraQt/QAdwaitaDecorations/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('32ab8f9f79b8a32e207ecc4a5624b2b1f04ab96f33991c7a3a7df6fd2f581228')

build() {
  cmake -B build-qt5 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=false
  make -C build-qt5

  cmake -B build-qt6 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=true
  make -C build-qt6
}

package_qadwaitadecorations-qt5() {
  pkgdesc='Qt5 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt5-wayland-decorations qt5-svg)

  DESTDIR="$pkgdir" make -C build-qt5 install
}

package_qadwaitadecorations-qt6() {
  pkgdesc='Qt6 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt6-wayland qt6-svg)

  DESTDIR="$pkgdir" make -C build-qt6 install
}
