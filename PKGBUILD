# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gnomish-icons-git
pkgver=r8.c0bb894
pkgrel=1
pkgdesc="GNOME-style icons for non-GNOME apps"
arch=(any)
url="https://github.com/realmazharhussain/gnomish-icons"
license=('custom')
depends=(adwaita-icon-theme)
provides=(gnomish-icons)
conflicts=(gnomish-icons)
source=("$pkgname"::"git+$url")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"

  DESTDIR="$pkgdir" ./install.sh /usr/share/icons

  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  cp -rt "$pkgdir"/usr/share/licenses/"$pkgname"/ licenses LICENSE.md Credits.md
  ln -sT /usr/share/icons/Gnomish/apps "$pkgdir"/usr/share/licenses/"$pkgname"/icons
}
