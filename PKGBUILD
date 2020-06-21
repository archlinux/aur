# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-dock-netspeed
pkgver=r7.3647c93
pkgrel=2
pkgdesc="Net speed plugin for Deepin Linux dock"
arch=('x86_64')
url="https://github.com/v-svg/dde-dock-netspeed"
license=('GPL')
depends=('deepin-network-utils' 'qt5-base'
         'procps-ng' 'deepin-dock')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname::git+https://github.com/v-svg/dde-dock-netspeed"
        "fix.patch")
sha512sums=('SKIP'
            '287cec038e9fe496fdab9ca9aef75ed387e2e28d603ffc894eab98809e35bafe8682fa823f188ae36384e4b13769ef52649dd6d9bab0a538461d1f18fba03d07')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  patch -p1 -i ../fix.patch
}

build() {
  cd ${pkgname}
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd ${pkgname}
  install -Dm 755 "libnetspeed.so" "${pkgdir}/usr/lib/dde-dock/plugins/libnetspeed.so"
}