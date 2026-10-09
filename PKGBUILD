# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=gimp-deskew-plugin
pkgname=gimp-plugin-deskew
pkgver=1.2
pkgrel=2
pkgdesc="Automatically unskew scanned documents"
arch=('x86_64')
url='https://github.com/gimp-plugins-justice/gimp-deskew-plugin'
license=('GPL-2.0-or-later')
depends=('gimp>=3'
         'glibc'
         'libgcc'
         'libstdc++'
         'glib2'
         'babl'
         'gegl')
makedepends=('automake' 'autoconf' 'intltool' 'gettext')
provides=('gimp-plugin-deskew')
conflicts=('gimp-plugin-deskew')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-autogen.patch")
sha256sums=('a5013be98ba8cf60a40704d8c8899ccabbd4f846ef0d813ead92dc378be4e74e'
            'dc30607cc0c7e53b79a08343d0b7cf779451c6cf5f196f7bf9245010cc494ab1')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -s -i "${srcdir}/${_pkgname}-autogen.patch"
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./autogen.sh --prefix=/usr
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dvm644 AUTHORS NEWS README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
