# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=OpenFIRE-App
_QTver=Qt5
pkgname=openfireapp
pkgver=3.0.1
pkgrel=1
pkgdesc='Configuration utility for the OpenFIRE lightgun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/TeamOpenFIRE/OpenFIRE-App'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-serialport' 'qt6-svg' 'icu')
makedepends=('cmake')
optdepends=(
            'qt5-base: For building with Qt5'
            'qt5-serialport: For building with Qt5'
            'qt5-svg: For building with Qt5'
)
install=$pkgname.install
source=("git+https://github.com/TeamOpenFIRE/OpenFIRE-App.git#tag=v${pkgver}")
md5sums=('dc2c2a0e31722f4c0d1a084df7c8d2d6')

prepare() {
  cd "$srcdir/$_name"
  git submodule update --init
}

build() {
  cmake -B "$srcdir/$_name/build" -DCMAKE_BUILD_TYPE=Release -DOFAPP_GITHASH=$(git rev-parse --short HEAD) -DOFAPP_QT_VERSION=$_QTver -S "$srcdir/$_name"
  cmake --build "$srcdir/$_name/build" --config Release
}

package() {
  install -Dm755 "$srcdir/$_name/build/OpenFIREapp" "$pkgdir/usr/bin/OpenFIREapp"
  install -Dm755 "$srcdir/$_name/img/ico/openfire.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.TeamOpenFIRE.OpenFIREapp.svg"
  install -Dm755 "$srcdir/$_name/org.TeamOpenFIRE.OpenFIREapp.desktop" "$pkgdir/usr/share/applications/org.TeamOpenFIRE.OpenFIREapp.desktop"
}
