# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='virt-viewer'
pkgver='2.0'
pkgrel='2'
pkgdesc='Lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('any')
url='http://virt-manager.org/'
depends=('spice' 'libvirt' 'libxml2' 'spice-gtk3')
makedepends=('libtool')
license=('GPL')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("e9c583bcb5acdabac6a8a13eff6ce4e093a3050645771628f832e15ce685d437")
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
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
  make
}

package() {
  pushd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  popd
}
