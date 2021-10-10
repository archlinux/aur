pkgname=xdg-desktop-portal-gtk-git
_pkgname=xdg-desktop-portal-gtk
pkgver=1.10.0+5+gcd51644
pkgrel=1
pkgdesc="A GTK+ backend for xdg-desktop-portal"
url="https://github.com/flatpak/xdg-desktop-portal-gtk"
arch=(x86_64)
license=(LGPL)
depends=('gtk3' 'gnome-desktop' 'gnome-keyring')
makedepends=('git' 'python' 'xdg-desktop-portal')
optdepends=("evince: Print preview")
provides=($_pkgname 'xdg-desktop-portal-impl')
conflicts=($_pkgname)
source=("git+https://github.com/flatpak/xdg-desktop-portal-gtk")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib \
    --enable-wallpaper \
    --enable-screenshot \
    --enable-screencast \
    --enable-background \
    --enable-settings \
    --enable-appchooser
  make 
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
