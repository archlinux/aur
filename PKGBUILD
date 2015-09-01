# $Id$
# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>

pkgname=file-roller-tmp
pkgver=3.16.3
pkgrel=2
pkgdesc="This version of file-roller puts temporary files in /tmp instead of ~/.cache and therefore reduces the amount of writes to SSDs."
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'dconf' 'libarchive' 'file' 'json-glib' 'libnotify' 'p7zip'
         'zip' 'unzip')
makedepends=('intltool' 'pkg-config' 'libnautilus-extension' 'itstool' 'docbook-xsl')
optdepends=('unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'cdrkit: ISO image support')
groups=('gnome-extra')
provides=('file-roller')
conflicts=('file-roller')
options=('!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname:0:11}/${pkgver:0:4}/${pkgname:0:11}-$pkgver.tar.xz
        tmp-as-temp.patch)
sha256sums=('2b3a1111caba26e67b96559a3118a700dbfb6a4c6ad7ebd3e509df227995411c'
            '9556742b38c06f131f7d56eb72522e38402a85ec99904be73ccae228f5b9572f')

prepare() {
  cd ${pkgname:0:11}-$pkgver
  patch -Np1 -i ../tmp-as-temp.patch
}

build() {
  cd ${pkgname:0:11}-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd ${pkgname:0:11}-$pkgver
  make DESTDIR="$pkgdir" install
}
