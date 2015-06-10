# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Keerthi <keerthi.linux@gmail.com>

pkgname=obex-data-server
pkgver=0.4.6
pkgrel=10
pkgdesc="A D-Bus service providing high-level OBEX client and server side functionality"
arch=('i686' 'x86_64')
url="http://wiki.muiline.com/${pkgname}"
license=('GPL')
depends=('dbus-glib' 'openobex' 'imagemagick' 'libusb-compat')
#source=("http://tadas.dailyda.com/software/${pkgname}-${pkgver}.tar.gz")
source=("http://pkgs.fedoraproject.org/repo/pkgs/${pkgname}/${pkgname}-${pkgver}.tar.gz/961ca5db6fe9c97024e133cc6203cc4d/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-openobex17.patch")
md5sums=('961ca5db6fe9c97024e133cc6203cc4d'
         '4199b3f0178d2b58eb36ee36ed1d07d5')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/${pkgname}-openobex17.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
