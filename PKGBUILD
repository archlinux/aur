# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=budgie-screensaver
pkgver=4.0
pkgrel=2
pkgdesc='Screensaver for the Budgie Desktop'
arch=('x86_64')
license=('GPL')
url='https://github.com/getsolus/budgie-screensaver'
backup=('etc/pam.d/budgie-screensaver')
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('intltool')
source=("https://github.com/getsolus/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        '0001-Fix-killing-gjs.patch')
sha256sums=('dde83f355e549b5f6290655f33acd910d2febbb8fd974f922b14814054f80f49'
            '4d66ab957b637510b21f9d6473a57d6890fbdb179d220ff875a26d461a67304e')

prepare() {
  cd $pkgname-v$pkgver
  # Fix killing gjs
  patch -Np1 -i ../0001-Fix-killing-gjs.patch
}

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
              --with-mit-ext --without-console-kit --with-systemd
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
}
