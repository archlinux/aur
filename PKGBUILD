# Maintainer: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>
pkgname=mergerfs
pkgver=2.8.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse attr)
options=(!emptydirs)
#makedepends=(pandoc)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('588a9b771a098ffc1cd86d7642b07d8c')
sha256sums=('bdc916ca762c2e2ed96c5328306b741070168fad6f704a741a3ed3ed29161911')
sha512sums=('27821d4425e2e4c5e9527166097e02ba5e554904bbe251fe9da5d371122103a2964fbd58500cd13ecc1b01da6718e0922a5b715c0161c71a27a7864df5f180e3')
_makeflags=""

build() {
  cd ./"${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/{share,bin}
  mkdir -p ${pkgdir}/usr/share/licenses/mergerfs
  make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
  install  -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}
