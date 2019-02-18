# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-icon-theme
pkgver=r
_pkgver=20190203
pkgrel=2
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
provides=('papirus-icon-theme' 'papirus-folders-nordic')
conflicts=()
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

build() {
 sh papirus-folders/script/install.sh
}

package() {

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -r "$srcdir"/papirus-folders/'README.md' "$pkgdir"/usr/share/doc/"$pkgname"/'README.md'
  cp -r "$srcdir"/papirus-folders/'LICENSE' "$pkgdir"/usr/share/licenses/"$pkgname"/'LICENSE'
  install -d "$pkgdir/usr/share/icons"
  cp -r papirus-icon-theme-*/build/usr/share/icons/* "$pkgdir"/usr/share/icons/

  sed -i 's!Name=Papirus!Name=Papirus-nordic!' "$pkgdir"/usr/share/icons/Papirus-nordic/index.theme
  sed -i 's!Name=Papirus-Dark!Name=Papirus-Dark-nordic!' "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/index.theme
  sed -i 's!Name=Papirus-Light!Name=Papirus-Light-nordic!' "$pkgdir"/usr/share/icons/Papirus-Light-nordic/index.theme
  sed -i 's!Name=ePapirus!Name=ePapirus-nordic!' "$pkgdir"/usr/share/icons/ePapirus-nordic/index.theme

  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Dark-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/Papirus-Light-nordic/
  gtk-update-icon-cache "$pkgdir"/usr/share/icons/ePapirus-nordic/

}
