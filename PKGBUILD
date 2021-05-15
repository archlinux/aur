# Maintainer: Jonas Gierer <jonas@gierer.xyz>

pkgname=adwaita-shell-theme
pkgver=40.1
pkgrel=1
pkgdesc="GNOME's default shell theme, without any third-party tweaks"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/data/theme"
license=(GPL)
makedepends=('sassc')
source=("https://gitlab.gnome.org/GNOME/gnome-shell/-/archive/$pkgver/gnome-shell-$pkgver.tar.gz")
sha256sums=('f2554a795b4c2e22328dbb5d8de9dc3b4c46189911c90a7ede5501fc3d1254f8')

build() {
  cd gnome-shell-$pkgver/data/theme
  find . -type f -print0 | xargs -0 sed -i "s/resource:\/\/\/org\/gnome\/shell\/theme/./g"
  sassc gnome-shell.scss > gnome-shell.css
}

package() {
  cd gnome-shell-$pkgver

  installdir=$pkgdir/usr/share/themes/Adwaita/gnome-shell
  mkdir -p $installdir
  cp -r ./data/theme/* $installdir

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
