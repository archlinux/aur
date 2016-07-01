# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='virt-viewer'
pkgver='4.0'
pkgrel='1'
pkgdesc='Lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('any')
url='http://virt-manager.org'
depends=('spice' 'libvirt' 'libvirt-glib' 'libxml2' 'spice-gtk3' 'spice-protocol' 'gtk-vnc')
makedepends=('libtool' 'intltool' 'gettext' 'automake' 'autoconf' 'pkg-config' 'intltool')
license=('GPL')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1c427b0ea104539342519334735e6f667d5784c42a5aafc253b580875d88fa1f')
install="${pkgname}.install"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
    --disable-update-mimedb
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
