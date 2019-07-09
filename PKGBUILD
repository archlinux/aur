# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=bionic

pkgname=ubuntu-themes
_ubuntu_rel=0ubuntu1
pkgver=19.04
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
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz")

sha512sums=('95b41c5d3a47fba9c4b5368b4e80d8924e09844783c66ca697ce0ff5d71f2b0fd4f56a9041dc142267e0eaf75fd5a8b47c0abae049fc3434b5e29f3f363d83e8')

build() {
   # Python 2 fix
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

  make
}

package() {
  # Install themes
  cd $srcdir/$pkgname-$pkgver
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
