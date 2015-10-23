# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>
pkgname=mergerfs
pkgver=2.7.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse attr)
options=(!emptydirs)
#makedepends=(pandoc)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
sha512sums=('521a100e61a3797fcdac967dc4e02ebb74de6c71926901e5c4c87061718b0438f1c7fb40d4106a9541583f82a4f34f600dc18e4752aa38408387054b1c4647c2')
sha256sums=('d092f2e499090fe535bd3ccbf768e72492b66f185cfda8aed3b1f62d4c0855d1')
md5sums=('9d73da2692f521cb14179c3bab09b992')

build() {
  cd ./"${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="${PREFIX}/bin"
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/{share,bin}
  mkdir -p ${pkgdir}/usr/share/licenses/mergerfs
  make PREFIX="/usr" DESTDIR="${pkgdir}" SBINDIR="${PREFIX}/bin" install
  install  -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}
