# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=caja-dropbox-gtk3
_pkgname=caja-dropbox
pkgver=1.18.0
pkgrel=1
pkgdesc="Dropbox for Linux - Caja (GTK3 version) extension"
url="https://github.com/mate-desktop/caja-dropbox"
arch=('i686' 'x86_64')
license=('custom:CC-BY-ND-3' 'GPL')
depends=('caja-gtk3'
         'glib2'
         'libnotify'
         'polkit'
         'procps'
         'pygtk'
         'xdg-utils')
makedepends=('mate-common' 'python2-docutils')
optdepends=('dropbox: Dropbox support')
conflicts=('caja-dropbox')
options=('!emptydirs')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('f58ca218d99b55e07950b7d5b5754d2bccaa7384')

prepare() {
  cd "$_pkgname-$pkgver"
  autoreconf -fi
  sed -i "s/python/python2/" configure.ac configure caja-dropbox.in Makefile.am Makefile.in rst2man.py
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
