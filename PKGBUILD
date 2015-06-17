# Contributor: fill <mailbox@fillo.ru>

pkgname=flashrom-svn
pkgver=0.9.8.r1888
pkgrel=1
pkgdesc='Flashrom is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI).'
url='http://www.flashrom.org/'
arch=(i686 x86_64)
provides=(flashrom)
conflicts=(flashrom)
replaces=(flashrom)
license=(GPL)
depends=(libftdi-compat pciutils)
makedepends=(subversion)
optdepends=('dmidecode: for SMBIOS/DMI table decoder support')
source=(flashrom::svn://coreboot.org/flashrom/trunk)
md5sums=('SKIP')

pkgver() {
  cd flashrom
  local ver="$(svnversion)"
  local release=`awk '/RELEASE := .*/ { print $3 }' Makefile`
  printf "$release.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd flashrom
  sed -i "s:sbin:bin:g" Makefile
}

build() {
  cd flashrom
  make
}

package() {
  cd flashrom
  make PREFIX="${pkgdir}/usr" install
}
