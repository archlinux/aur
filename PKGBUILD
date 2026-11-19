# Maintainer: Matteo Nista <m.nista@hotmail.it>
pkgname=xdg-desktop-portal-gtk4-bin
pkgver=1.6.6
pkgrel=1
pkgdesc='GTK4 backend for xdg-desktop-portal (prebuilt release binary)'
arch=('x86_64')
url='https://github.com/JohnRTitor/xdg-desktop-portal-gtk4'
license=('LGPL-2.1-only')
depends=('xdg-desktop-portal' 'gtk4' 'glib2' 'gdk-pixbuf2' 'glibc' 'libgcc')
makedepends=('make')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-gtk4')
conflicts=('xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-git' 'xdg-desktop-portal-gtk4-printfix')
options=('!strip' '!debug')
# The release binary is unpatched: the local Print fixes live in the -printfix package.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/xdg-desktop-portal-gtk4-linux-x86_64.tar.gz"
        "xdg-desktop-portal-gtk4-$pkgver.tar.gz::$url/releases/download/v$pkgver/xdg-desktop-portal-gtk4-$pkgver.tar.gz")
sha256sums=('97383a6c2efacbdb6da68e23407b61249f80e58ab0f3007b034c50c1b7ba0085'
            '884a04d217dda4d0bf8872724e5c91fb6be76eb04d4d10f0301262f3f6b9f5bd')

package() {
  install -Dm755 "$srcdir/xdg-desktop-portal-gtk4" "$pkgdir/usr/lib/xdg-desktop-portal-gtk4"
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  make install-data DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
