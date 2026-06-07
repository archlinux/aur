# Maintainer: Capricornus007 <sihaogang at gmail dot com>
# Co-Maintainer: budRich <of budlabs>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Kevin Hanselman <kevin.hanselman@gmail.com>
pkgname=xfce4-genmon-plugin-git
pkgver=r1202.48e9662
pkgrel=1
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel"
arch=('x86_64')
license=('LGPL2')
makedepends=('git' 'xfce4-dev-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('xfce4-panel')
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-genmon-plugin.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # 修正：直接指定正確的源碼目錄名稱「xfce4-genmon-plugin」
  meson setup --prefix=/usr \
              --buildtype=plain \
              "xfce4-genmon-plugin" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
