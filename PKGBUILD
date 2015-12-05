# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: mgzzy <themgzzy@gmail.com>
pkgname=rubrica
pkgver=2.0.2
pkgrel=2
pkgdesc="An addressbook manager for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://rubrica.berlios.de/"
license=('GPL3')
depends=('desktop-file-utils' 'libglade' 'libnotify' 'gconf' 'shared-mime-info')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
install=rubrica.install
source=(http://download.berlios.de/rubrica/rubrica2-$pkgver.tar.bz2
        rubrica-$pkgver.diff)
md5sums=('a3b57d15d8ccd5bcc1a0c5be29ae08bc'
         '7fdf967461a8a56c92883746b6f412e8')

build() {
  cd "$srcdir/rubrica2-$pkgver"
  patch -Np1 -i ../rubrica-$pkgver.diff || return 1
  ./configure --prefix=/usr --disable-schemas-install || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
