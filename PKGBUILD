# Maintainer: coolingtool <coolingtool-backup@outlook.com>

pkgbase=qadwaitadecorations
_pkgname=QAdwaitaDecorations
pkgname=(qadwaitadecorations-qt5 qadwaitadecorations-qt6)
pkgver=0.1.2
pkgrel=1
pkgdesc=' Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=('x86_64')
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1)
makedepends=(make cmake qt5-wayland qt6-wayland qt5-svg qt6-svg)
source=("https://github.com/FedoraQt/QAdwaitaDecorations/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('7243ec7c57fa790316bc2ec9d11dc09452c8626e20d86dd17ab85143920f7eaa')

build() {
  cmake -B build-$pkgver-qt5 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAS_QT6_SUPPORT=false `# Set to true if qt5-wayland has the required patches` \
        -DUSE_QT6=false
  make -C build-$pkgver-qt5

  cmake -B build-$pkgver-qt6 -S $_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=true
  make -C build-$pkgver-qt6
}

package_qadwaitadecorations-qt5() {
  pkgdesc='Qt5 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt5-wayland qt5-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt5 install
}

package_qadwaitadecorations-qt6() {
  pkgdesc='Qt6 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt6-wayland qt6-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt6 install
}
