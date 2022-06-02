# Maintainer: Ahmad Rulim <personal@rulim34.dev>
# Contributor: Jonas Gierer <jonas@gierer.xyz>

pkgname=adwaita-shell-theme
pkgver=42.2
pkgrel=1
pkgdesc="GNOME's default shell theme, without any third-party tweaks"
arch=(any)
url="https://gitlab.gnome.org/GNOME/gnome-shell/-/tree/main/data/theme"
license=(GPL)
makedepends=('sassc')
source=("https://gitlab.gnome.org/GNOME/gnome-shell/-/archive/$pkgver/gnome-shell-$pkgver.tar.gz")
sha256sums=('6e609f863c8831fd5f2728ffc3fab94c37425ae318ea9947747c5a508aa925d5')

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
