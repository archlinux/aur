# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-icon-theme
pkgver=r
_pkgver=20190203
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
conflicts=('papirus-icon-theme')
replaces=('papirus-folders-nordic')
depends=('gtk-update-icon-cache')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/PapirusDevelopmentTeam/$_pkgname/archive/$_pkgver.tar.gz"
	"papirus-folders::git+https://github.com/basigur/papirus-folders")
	sha512sums=('40e274b31cf3f78512229c68c9fc52efcf7f2cb36db4c474052fd954e31ad5ca4f2345df9cc26017056a0604cc1cc9ccd77b4b703d6020da1a8aede571a82926'
	'SKIP'
)

pkgver() {
  cd papirus-folders

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install

  ##papirus-folders##
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -r "$srcdir"/papirus-folders/'README.md' "$pkgdir"/usr/share/doc/"$pkgname"/'README.md'
  cp -r "$srcdir"/papirus-folders/'LICENSE' "$pkgdir"/usr/share/licenses/"$pkgname"/'LICENSE'
  cp -rf "$srcdir"/papirus-folders/Papirus "$pkgdir"/usr/share/icons/


  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus/

}
