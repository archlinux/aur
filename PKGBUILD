# Maintainer: linfeng <2844126834@qq.com>

pkgbase=qwhitesurgtkdecorations
_pkgname=QWhiteSurGtkDecorations
pkgname=(qwhitesurgtkdecorations-qt5 qwhitesurgtkdecorations-qt6)
pkgver=0.2.0
pkgrel=1
pkgdesc=' Qt decoration plugin implementing WhiteSur-gtk-like client-side decorations'
arch=('x86_64')
url='https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations'
license=(LGPL2.1)
makedepends=(make cmake qt5-wayland-decorations qt6-wayland qt5-svg qt6-svg)
source=("https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations/archive/$pkgver/$_pkgname-$pkgver.tar.gz")

build() {
  cmake -B build-$pkgver-qt5 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAS_QT6_SUPPORT=true \
        -DUSE_QT6=false
  make -C build-$pkgver-qt5

  cmake -B build-$pkgver-qt6 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=true
  make -C build-$pkgver-qt6
}

package_qwhitesurgtkdecorations-qt5() {
  pkgdesc='Qt5 decoration plugin implementing WhiteSur-gtk-like client-side decorations'
  depends=(qt5-wayland-decorations qt5-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt5 install
}

package_qwhitesurgtkdecorations-qt6() {
  pkgdesc='Qt6 decoration plugin implementing WhiteSur-gtk-like client-side decorations'
  depends=(qt6-wayland qt6-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt6 install
}

sha256sums=('2843131b0dbd2d9c2ea596a76c77a1f7053649f8e14f108ef750373d905dcbf9')
