# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: coolingtool <coolingtool-backup@outlook.com>

pkgbase=qadwaitadecorations
_pkgname=QAdwaitaDecorations
pkgname=(qadwaitadecorations-qt5 qadwaitadecorations-qt6)
pkgver=0.1.7
pkgrel=5
commit=22a97da98a8d91021c63600250711adf4ccf11d7
pkgdesc='Qt decoration plugin implementing Adwaita-like client-side decorations'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/FedoraQt/QAdwaitaDecorations'
license=(LGPL2.1-or-later)
makedepends=(make cmake git qt5-base qt5-wayland-decorations qt6-base qt6-wayland qt5-svg qt6-svg)
source=("git+https://github.com/FedoraQt/QAdwaitaDecorations.git#commit=$commit")
sha256sums=('dab1d24a75ab1efb09153575347db39894b44af8ae80d622e9e2c5f0a36a4b3f')

#prepare() {
#  cd $_pkgname-$pkgver
#  patch -p1 -i $srcdir/qt6.10.patch
#}

build() {
  cmake -B build-$pkgver-qt5 -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAS_QT6_SUPPORT=true \
        -DUSE_QT6=false
  make -C build-$pkgver-qt5

  cmake -B build-$pkgver-qt6 -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_QT6=true
  make -C build-$pkgver-qt6
}

package_qadwaitadecorations-qt5() {
  pkgdesc='Qt5 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt5-base qt5-wayland-decorations qt5-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt5 install
}

package_qadwaitadecorations-qt6() {
  pkgdesc='Qt6 decoration plugin implementing Adwaita-like client-side decorations'
  depends=(qt6-base qt6-wayland qt6-svg)

  DESTDIR="$pkgdir" make -C build-$pkgver-qt6 install
}
