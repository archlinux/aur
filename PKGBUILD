# Maintainer: Jan Pacner <dumblob@gmail.com>

_basename=mygtkmenui
pkgname=${_basename}-git
pkgver=15.6c0a589
pkgrel=1
pkgdesc="myGtkMenu improved; GTK2, GTK3 standalone & lightweight menu written in C"
arch=('i686' 'x86_64')
url="https://github.com/dumblob/$_basename"
license=('GPL')
source=("$_basename::git+https://github.com/dumblob/mygtkmenui")
sha256sums=('SKIP')
depends=('gtk3')
#depends=('gtk2>=2.4')

build() {
  cd "$_basename"
  msg "Starting make..."
  make  # GTK3 by default
  #make GTK=`pkg-config --cflags --libs gtk+-2.0`  # GTK2
}

pkgver() {
  cd "$_basename"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$_basename"
  install -D -m755 "$_basename"            "$pkgdir/usr/bin/$_basename"
  install -D -m644 "example_menu.desc"     "$pkgdir/usr/share/doc/$_basename/example_menu.desc"
  install -D -m644 "${_basename}.desktop"  "$pkgdir/usr/share/applications/${_basename}.desktop"
  install -D -m644 "icon/${_basename}.svg" "$pkgdir/usr/share/pixmaps/${_basename}.svg"
  install -D -m644 "icon/${_basename}.png" "$pkgdir/usr/share/pixmaps/${_basename}.png"
}
