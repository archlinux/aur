# Maintainer: Zhaose <zhaose233@outlook.com>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Francis Carroll (franciscarroll at gmail dot com)

pkgname=splix-git
_pkgname=splix
provides=(splix)
conflicts=(splix)
pkgver=2.0.2.r3.g7a80218
pkgrel=1
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers"
arch=('x86_64')
url="https://openprinting.github.io/splix/"
license=('GPL-2.0-only')
depends=('libcups' 'gcc-libs' 'ghostscript' 'jbigkit')
makedepends=('krb5' 'git' 'cups')
install=splix.install
source=(git+https://github.com/OpenPrinting/splix.git)
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make drv
  make all DRV_ONLY=1
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install DRV_ONLY=1
}

# vim:set ts=2 sw=2 et:
