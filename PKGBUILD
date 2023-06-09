# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >
# Contributor: fisch02

pkgname=xdg-desktop-portal-gtk-git
_pkgname=xdg-desktop-portal-gtk
pkgver=1.14.1+13+gb6a8b0a
pkgrel=1
pkgdesc="A GTK backend for xdg-desktop-portal"
url="https://github.com/flatpak/xdg-desktop-portal-gtk"
arch=(x86_64)
license=(LGPL)
depends=('gtk3')
makedepends=('git' 'xdg-desktop-portal' 'autoconf' 'automake')
optdepends=("evince: Print preview")
provides=($_pkgname 'xdg-desktop-portal-impl')
conflicts=($_pkgname)
source=("git+https://github.com/flatpak/xdg-desktop-portal-gtk")
sha256sums=('SKIP')

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
    --enable-background \
    --enable-settings \
    --enable-appchooser \
    --enable-lockdown
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
