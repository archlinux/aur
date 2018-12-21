# Maintainer: Lizr <oilizr2004@gmail.com>
# Contributor: equation314 <https://github.com/equation314>
pkgname=ccrplus
pkgver=1.1.0
pkgrel=2
pkgdesc="A opensource and cross-platform judge environment for OI contest."
arch=('x86_64')
url="https://github.com/sxyzccr/CCR-Plus"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'gcc' 'qt5-base')
md5sums=() #autofill using updpkgsums

prepare() {
  cd "$srcdir"
  if [ -e CCR-Plus ]; then
    cd CCR-Plus
    git pull
  else
    git clone https://github.com/sxyzccr/CCR-Plus
	cd CCR-Plus
  fi
  git apply $srcdir/../ccr-plus.patch
}

build() {
  cd "$srcdir/CCR-Plus"
  mkdir -p build && cd build
  qmake-qt5 ..
  make -j$(nproc)
}

package() {
  cd "$srcdir/CCR-Plus"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/ccrplus/checker"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp 'build/src/CCR-Plus' "$pkgdir/usr/share/ccrplus"
  cp 'build/src/tools/checker/fulltext' "$pkgdir/usr/share/ccrplus/checker"
  cp 'build/src/tools/monitor/monitor' "$pkgdir/usr/share/ccrplus"
  cp 'resources/CCR.ico' "$pkgdir/usr/share/icons/hicolor/scalable/apps/ccrplus.ico"
  cp "$pkgdir/../../ccrplus.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/usr/share/ccrplus/CCR-Plus" "$pkgdir/usr/bin/ccrplus"
}
