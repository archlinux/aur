# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-kwin-git
pkgver=5.5.11.r27.gb5c00527b
pkgrel=1
pkgdesc='KWin configures on DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-kwin"
license=('GPL3')
depends=('deepin-qt5integration' 'deepin-wallpapers' 'deepin-kwin')
makedepends=('extra-cmake-modules' 'expac' 'ninja' 'qt5-tools')
provides=('dde-kwin-reborn' 'dde-kwin')
conflicts=('dde-kwin-reborn' 'dde-kwin')
groups=('deepin-git')
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

