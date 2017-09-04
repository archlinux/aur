# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=caja-dropbox
pkgver=1.18.0
pkgrel=2
pkgdesc="Dropbox for Linux - Caja extension"
url="https://github.com/mate-desktop/caja-dropbox"
arch=('i686' 'x86_64')
license=('custom:CC-BY-ND-3' 'GPL')
depends=('caja'
         'glib2'
         'libnotify'
         'polkit'
         'procps'
         'pygtk'
         'xdg-utils')
makedepends=('mate-common' 'python2-docutils')
optdepends=('dropbox: Dropbox support')
conflicts=('caja-dropbox-gtk3')
source=("https://pub.mate-desktop.org/releases/1.18/$pkgname-$pkgver.tar.xz")
sha256sums=('af88597b7da5815f7debe33c1bb95098a21abe4a7057e9834546752597428da3')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  sed -i "s/python/python2/" configure.ac configure caja-dropbox.in Makefile.am Makefile.in rst2man.py
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
