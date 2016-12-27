# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=yakkety

pkgname=ubuntu-themes
_actual_ver=16.10
_extra_ver=+17.04.20161205
_ubuntu_rel=0ubuntu1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Ubuntu monochrome icon theme, Ambiance and Radiance themes, and Ubuntu artwork"
arch=(any)
url="https://launchpad.net/ubuntu-themes"
license=(CCPL)
groups=(unity-extra)
depends=(humanity-icon-theme adwaita-icon-theme hicolor-icon-theme
         gtk-engine-murrine)
makedepends=(python2 imagemagick icon-naming-utils)
provides=(light-themes ubuntu-mono)
conflicts=(light-themes ubuntu-mono)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz")

sha512sums=('42bb622ad6818f7bf2e9f163f4a9a342fd7d8bad5e8a50db2d439857d053b0827543b7e8f626588316670fd6c63d050ecc522aef52e49c5c336ac08f6f303238')

build() {
  #cd "${pkgname}-${_actual_ver}${_extra_ver}"

  # Python 2 fix
  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

  make
}

package() {
  #cd "${pkgname}-${_actual_ver}${_extra_ver}"

  # Install themes
  install -dm755   "${pkgdir}/usr/share/themes/"
  cp -av Ambiance/ "${pkgdir}/usr/share/themes/"
  cp -av Radiance/ "${pkgdir}/usr/share/themes/"

  # Install icons
  install -dm755            "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-dark/  "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-light/ "${pkgdir}/usr/share/icons/"
  cp -av LoginIcons/        "${pkgdir}/usr/share/icons/"
  cp -av suru-icons/        "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mobile/     "${pkgdir}/usr/share/icons/"

  mv "${pkgdir}"/usr/share/icons/{suru-icons,suru}/

  install -Dm644 distributor-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}
