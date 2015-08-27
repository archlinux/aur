# Maintainer: Jesus Gonzalez <jesusmgh@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: Stefan Achatz <erazor_de@users.soruceforge.net>

pkgname=('roccat-tools-full')
_pkgbase=roccat-tools
pkgver=3.6.1
pkgrel=2
pkgdesc='Userland applications to configure and make extended use of ROCCAT devices'
arch=('i686' 'x86_64')
url='http://roccat.sourceforge.net'
license=('GPL2')
depends=('libgaminggear>=0.11.1' 'libcanberra' 'gtk2' 'libnotify>=0.7.0' 'dbus-glib' 'udev' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('kmod-roccat: Adds support for the old kone device.'
            'roccat-dkms: Adds support for the old kone device with dynamic rebuild.')
conflicts=('roccat-tools-common')
replaces=('roccat-tools-common')
source=("http://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-$pkgver.tar.bz2"
        'udev-compilation-error-fix.patch')
install=roccat-tools.install
sha1sums=('3eab9a07dd586eb6c1648b060f36b4592525416b'
          'd31ad74bf91628f21415a631ec0f57b707266d0f')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  patch -p1 -i ../udev-compilation-error-fix.patch
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUDEVDIR=/usr/lib/udev/rules.d -DWITHOUT_PYTHON=TRUE
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir/" install
}

