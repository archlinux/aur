# Maintainer: Jesus Gonzalez <jesusmgh@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: Stefan Achatz <erazor_de@users.soruceforge.net>

pkgname=('roccat-tools-full')
_pkgbase=roccat-tools
pkgver=5.6.0
pkgrel=1
pkgdesc='Userland applications to configure and make extended use of ROCCAT devices'
arch=('i686' 'x86_64')
url='http://roccat.sourceforge.net'
license=('GPL2')
depends=('libgaminggear>=0.15' 'libcanberra' 'gtk2' 'libnotify>=0.7.0' 'dbus-glib' 'udev' 'hicolor-icon-theme' 'libgudev' 'lua>=5.3')
makedepends=('cmake')
optdepends=('kmod-roccat: Adds support for the old kone device.'
            'roccat-dkms: Adds support for the old kone device with dynamic rebuild.')
conflicts=('roccat-tools-common')
replaces=('roccat-tools-common')
source=("http://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-$pkgver.tar.bz2")
install=roccat-tools.install
sha1sums=('438f9d5c57aabb9820b0df7fab89bfc2d9cfed5f')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUDEVDIR=/usr/lib/udev/rules.d -DWITHOUT_PYTHON=TRUE -DWITH_LUA="5.3"
  
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  
  make DESTDIR="$pkgdir/" install
}

