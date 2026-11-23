# Maintainer: Navon John Lukose <67406856+Magniquick@users.noreply.github.com>
# Contributor: Matteo Nista <m.nista@hotmail.it>
pkgname=xdg-desktop-portal-gtk4-bin
pkgver=1.6.7
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
sha256sums=('7ab7e37188207f7530d33d4a8f6b4211110b84b6ab2e4bc4c78755a3db41d8d8'
            '0d63001f7b97673f45cd32fa677bee5d1e0322b3511b2359e4a8165cd8d35867')

package() {
  install -Dm755 "$srcdir/xdg-desktop-portal-gtk4" "$pkgdir/usr/lib/xdg-desktop-portal-gtk4"
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  make install-data DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
