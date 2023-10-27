# Maintainer: Patrick Gelvin <patrick@gelvin.dev>
pkgname="rcalc"
pkgver=v1.1.0
pkgrel=1
pkgdesc="A lightweight RPN calculator"
arch=("x86_64")
url="https://github.com/gelvinp/rcalc"
license=('MIT')
depends=('glfw>=3.0.0', 'freetype2>=2.0.0')
makedepends=("python>=3.11.0" "scons>=4.5.0" "pkg-config" "git")
_tag=1e65a5ba72485b504fd8cedc44503901aa83a74b # git rev-parse "tag-name"
source=(git+https://github.com/gelvinp/rcalc#tag=$_tag?signed)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe
}

build() {
  cd "$pkgname"

  BUILD_NAME="pkgbuild" VERSION_STATUS="stable" scons target=release
}

package() {
  cd "$pkgname"

  mkdir -p $pkgdir/usr/bin
  cp bin/rcalc.linux.release.$CARCH $pkgdir/usr/bin/rcalc
  mkdir -p $pkgdir/usr/share/licenses/rcalc
  cp LICENSE.md $pkgdir/usr/share/licenses/rcalc/LICENSE.md

  mkdir -p $pkgdir/usr/share/applications
  cp misc/rcalc.desktop $pkgdir/usr/share/applications/rcalc.desktop
  mkdir -p $pkgdir/usr/share/pixmaps
  cp icon.svg $pkgdir/usr/share/pixmaps/rcalc.svg
}
