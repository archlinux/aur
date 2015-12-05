# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: mgzzy <themgzzy@gmail.com>
# Contributor: kaptoxic @ yahoo . com
pkgname=rubrica
pkgver=2.0.12
pkgrel=1
pkgdesc="An address book manager for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://rubrica.berlios.de/"
license=('GPL3')
depends=('desktop-file-utils' 'libglade' 'libnotify' 'gconf' 'shared-mime-info')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
install=rubrica.install
source=(http://downloads.sourceforge.net/project/rubrica.berlios/rubrica2-2.0.12.tar.bz2
	rubrica-2.0.12.diff)
md5sums=('582b9e8c4ca9b17f83afa5a3d5842bc9'
         'e2731e3d8b3978cece90aedb458e59ec')

build() {
  cd "$srcdir/rubrica2-$pkgver"
  patch -Np2 -i ../rubrica-$pkgver.diff || return 1
  ./configure --prefix=/usr --disable-schemas-install LIBS=-lgthread-2.0 --with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 1
  make || return 1
}

package() {
  cd "$srcdir/rubrica2-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
}
