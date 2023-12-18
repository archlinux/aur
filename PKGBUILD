# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=ladish
pkgver=1.1
pkgrel=1
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://ladish.org"
license=('GPL2' 'custom:AFL2.1')
depends=('a2jmidid' 'cdbus' 'dbus-glib' 'dbus-python' 'expat' 'glibc' 'gtkmm' 'jack2-dbus' 'libgnomecanvasmm' 'python' 'util-linux-libs')
makedepends=('boost' 'git' 'intltool')
optdepends=('laditools: Provides ladi-control-center the default JACK configuration tool in gladish')
provides=('lash')
conflicts=('lash')
source=("git+https://gitea.ladish.org/LADI/ladish.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  ./waf configure --prefix=/usr \
                  --enable-gladish \
                  --enable-liblash
  ./waf
}

package() {
  cd "${pkgname}"
  ./waf install --destdir="${pkgdir}"
  install -Dm644 afl21.txt "$pkgdir/usr/share/licenses/$pkgname/AFL-2.1.txt"
}
