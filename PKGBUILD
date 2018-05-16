# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=onyx-git
pkgver=0.4.2+37+g84feff8
pkgrel=1
pkgdesc='Decentralized messaging application based on PSS (git)'
arch=(any)
url='https://mainframe.com'
license=(MIT)
depends=(yarn)
makedepends=(libicns)
conflicts=(onyx onyx-bin)
options=(!strip)
source=(git+https://github.com/MainframeHQ/onyx.git)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/onyx
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd $srcdir/onyx
  yarn
  yarn build:binaries
  yarn dist
}

package() {
  cd $srcdir/onyx
  install -Dm 755 dist/Mainframe\ Alpha.AppImage $pkgdir/usr/bin/onyx
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/onyx/LICENSE
}
