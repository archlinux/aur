# Maintainer: Capricornus007 <sihaogang at gmail dot com>
# Co-Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-cpugraph-plugin
pkgname=${_pkgname}-devel
pkgver=1.3.0
pkgrel=1
pkgdesc="CPU graph plugin for the Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
groups=('xfce4-goodies-devel')
depends=('xfce4-panel')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/panel-plugins/${_pkgname}/1.3/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('c3305edea13ae785ea8b7ce8efbb40b5d5cac69a6f8bf790e4f2efaa780ca097')

build() {
  # 修正：指向正確的 xfce4-cpugraph-plugin-1.3.0 目錄
  meson setup --prefix=/usr \
              --buildtype=plain \
              "${_pkgname}-${pkgver}" build

  meson compile -C build
}

package() {
  # 修正：同樣使用正確的 build 目錄安裝
  DESTDIR="$pkgdir" meson install -C build
}
