# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

_pkgname=libgudev
pkgname=lib32-libgudev
pkgver=230
pkgrel=1
pkgdesc="GObject bindings for libudev (32 bit, library only)"
arch=('x86_64')
url="https://wiki.gnome.org/Projects/libgudev"
license=('LGPL2.1')
depends=('lib32-systemd' 'libgudev' 'gcc-multilib')
makedepends=('lib32-systemd' 'gobject-introspection' 'gtk-doc' 'lib32-glib2')
provides=('libgudev-1.0.so')
conflicts=('lib32-systemd<221')
source=("${_pkgname}-${pkgver}.tar.xz::https://download.gnome.org/sources/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18')

build() {
  cd "${_pkgname}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share
}
