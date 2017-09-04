# Maintainer: Brian Bidlock <bidulock@openss7.org>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid at gmail dot com>

src_name=libsoup
pkgname=libsoup-gnome
pkgver=2.59.90.1
pkgrel=1
_sfx=${pkgver#*.*.}
_base_version=${pkgver%.$_sfx}
pkgdesc="Gnome HTTP Library with gnome integration enabled"
arch=('i686' 'x86_64')
url="http://live.gnome.org/LibSoup"
license=('LGPL')
depends=('gnome-keyring' 'libproxy' 'glib-networking' 'sqlite')
makedepends=('intltool' 'gtk-doc' 'gnome-common' 'vala' 'python')
provides=('libsoup' 'libsoup-gnome-git')
conflicts=('libsoup' 'libsoup-gnome-git')
options=('!libtool')
source=("https://ftp.gnome.org/pub/GNOME/sources/${src_name}/${_base_version}/${src_name}-${pkgver}.tar.xz")
sha256sums=('e0c396be890f6704bd449de3bc3b94c671a87f29063bab445fa9ceaf81e2082e')

build() {
  cd ${src_name}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --disable-static --with-gnome --disable-gtk-doc
  make
}

package() {
  cd ${src_name}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}
