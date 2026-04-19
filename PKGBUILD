# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com> 
# Creator:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname=efibootmgr-git
pkgver=18+14+g0a85e9b
pkgrel=1
pkgdesc="Linux user-space application to modify the EFI Boot Manager"
arch=('x86_64')
url="https://github.com/rhboot/efibootmgr"
license=('GPL2')
depends=('glibc' 'popt')
makedepends=('efivar' 'git')
provides=(efibootmgr)
conflicts=(efibootmgr)
source=(git+https://github.com/rhboot/efibootmgr)
sha512sums=('SKIP')

pkgver() {
  cd efibootmgr
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd efibootmgr
  make libdir='/usr/lib' sbindir='/usr/bin' EFIDIR='arch'
}

package() {
  depends+=('libefiboot.so' 'libefivar.so')
  cd efibootmgr
  make DESTDIR="${pkgdir}" \
       libdir='/usr/lib' \
       sbindir='/usr/bin' \
       EFIDIR='arch' \
       install
  install -vDm 644 {AUTHORS,README,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
