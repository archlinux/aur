# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='virt-viewer'
pkgver='3.0'
pkgrel='1'
pkgdesc='Lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('any')
url='http://virt-manager.org/'
depends=('spice' 'libvirt' 'libxml2' 'spice-gtk3' 'spice-protocol' 'gtk-vnc')
makedepends=('libtool' 'intltool')
license=('GPL')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6331fd64ef9e999e0943844ddc0f89d35bd91bcc9c8e919f7274500930e97144')
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
