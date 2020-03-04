# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgbase=artwork-maia
_pkgname=maia
pkgname=('artwork-maia' 'maia-icon-theme' 'plasma5-themes-maia' 'sddm-maia-theme' 'maia-wallpaper')
pkgrel=1
pkgver=r218
url='https://gitlab.manjaro.org/artwork/themes/maia'
arch=('any')
license=('GPL2')
makedepends=('phonon-qt5-gstreamer' 'extra-cmake-modules' 'plasma-framework' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  _REV=$(git rev-list --count master)
  printf "r${_REV}"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package_artwork-maia() {
  pkgdesc="Maia artwork meta-package"
  depends=('maia-icon-theme' 'maia-wallpaper' 'plasma5-themes-maia' 'sddm-maia-theme')
  cd build
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/wallpapers"
}

package_maia-wallpaper() {
  pkgdesc='Maia wallpaper'
  cd build
  make DESTDIR="${pkgdir}" install

  install -D ${pkgdir}/usr/share/wallpapers/Maia/contents/images/1920x1080.png ${pkgdir}/usr/share/backgrounds/maia.png

  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/wallpapers"
  rm -rf "${pkgdir}/usr/share/metainfo"
}

package_maia-icon-theme() {
  pkgdesc='Maia icon theme'
  cd build
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/wallpapers"
  rm -rf "${pkgdir}/usr/share/metainfo"
}

package_plasma5-themes-maia() {
  pkgdesc='Maia theme for KDE Plasma 5'
  depends=('breeze' 'maia-icon-theme')
  replaces=('maia-themes')
  cd build
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/metainfo"
}

package_sddm-maia-theme() {
  pkgdesc="Maia theme for SDDM"
  cd build
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/wallpapers"
  rm -rf "${pkgdir}/usr/share/metainfo"
}
