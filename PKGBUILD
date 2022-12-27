# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-kwin-git
pkgver=5.5.11.r25.gff663502d
pkgrel=1
pkgdesc='KWin configures on DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-kwin"
license=('GPL3')
depends=('deepin-qt5integration-git' 'deepin-wallpapers-git' 'kwin')
makedepends=('extra-cmake-modules' 'expac' 'ninja' 'qt5-tools')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-kwin/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DKWIN_VERSION=$(expac %v kwin | cut -d - -f 1)
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install

  chmod +x "$pkgdir"/usr/bin/kwin_no_scale
}

