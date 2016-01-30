# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='virt-viewer'
pkgver='3.1'
pkgrel='2'
pkgdesc='Lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('any')
url='http://virt-manager.org/'
depends=('spice' 'libvirt' 'libxml2' 'spice-gtk3' 'spice-protocol' 'gtk-vnc')
makedepends=('libtool' 'intltool')
license=('GPL')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('be4e49470b650fc22513c2c01f2e13e30ee2d494d0d7b319b6f414ca781078c7')
install="${pkgname}.install"

prepare() {
  pushd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --includedir=/usr/include/security \
    --with-gtk=3.0 \
    --disable-update-mimedb
  popd
}

build() {
  pushd "${pkgname}-${pkgver}"
  make
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  popd
}
