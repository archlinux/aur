# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=mstflint
pkgver=4.21.0.1
_pkgver=4.21.0-1
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards (without inband support)'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'sqlite')
makedepends=('git')
source=("git+https://github.com/Mellanox/${pkgname}#tag=v${_pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --disable-inband
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
