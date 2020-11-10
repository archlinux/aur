# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=bionic

pkgname=ubuntu-themes
_ubuntu_rel=0ubuntu1
pkgver=20.10
pkgrel=2
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

sha512sums=('0118f7c2404856216ff2df0246ea2fa98d0d5b25973abc3df13a998f7a41f2eeb32ca08281ba41399a91fa16ab046e3b3292f504503958983a6488c1e3001ac4')

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
  cp -av suru-icons/        "$pkgdir/usr/share/icons/"
  cp -av ubuntu-mobile/     "$pkgdir/usr/share/icons/"

  mv "$pkgdir"/usr/share/icons/{suru-icons,suru}/

  install -Dm644 distributor-logo.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}
