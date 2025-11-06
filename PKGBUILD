# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=bionic

pkgname=ubuntu-themes
_ubuntu_rel=0ubuntu1
pkgver=24.04
pkgrel=1
pkgdesc="Ubuntu monochrome icon theme, Ambiance and Radiance themes, and Ubuntu artwork"
arch=(any)
url="https://launchpad.net/ubuntu-themes"
license=(CCPL)
groups=(unity-extra)
depends=(humanity-icon-theme adwaita-icon-theme hicolor-icon-theme
         gtk-engine-murrine)
makedepends=(python imagemagick icon-naming-utils)
provides=(light-themes ubuntu-mono)
conflicts=(light-themes ubuntu-mono)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ubuntu-themes/""$pkgver-""$_ubuntu_rel/""${pkgname}_""$pkgver.orig.tar.gz")

sha512sums=('f213105c0821bd2bf95c0be6501c2f0dbc03a32e29d0649748bcf3a10d0a5594e2a1e6fc33efc023c847993edf3ff25448e0abf1c5c062c97e9654009f33cfc7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  # Install themes
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755   "$pkgdir/usr/share/themes/"
  cp -av Ambiance/ "$pkgdir/usr/share/themes/"
  cp -av Radiance/ "$pkgdir/usr/share/themes/"

  # Install icons
  install -dm755            "$pkgdir/usr/share/icons/"
  cp -av ubuntu-mono-dark/  "$pkgdir/usr/share/icons/"
  cp -av ubuntu-mono-light/ "$pkgdir/usr/share/icons/"
  cp -av LoginIcons/        "$pkgdir/usr/share/icons/"
  cp -av ubuntu-mobile/     "$pkgdir/usr/share/icons/"

  install -Dm644 distributor-logo.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}
