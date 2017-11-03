# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=artful

pkgname=ubuntu-themes
_actual_ver=16.10
_extra_ver=+17.10.20171012.1
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

sha512sums=('12e185c4d9321a59009ba920b5c89d562066757160d4ae4ea17094bcb471ed3884eae225904e309844ed696bc0fa49394caaddf5d1769f0666f45edbab0129b5')

build() {
   # Python 2 fix
  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

  make
}

package() {
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
