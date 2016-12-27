# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=yakkety

pkgname=ubuntu-themes
_actual_ver=16.10
_extra_ver=+16.10.20161024
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

sha512sums=('3cafb43220885257673f0a629b122511fef2954e45ab7426a2425a543f7602ab85f74509cf1fdf2c586ce968bc73669e46dfdf91bad09fe0dff1c2dad4a58f27')

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
