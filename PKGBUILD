# Maintainer: 7Ji <pugokushin@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=beep-sudoable
pkgver=1.4.12
pkgrel=1
pkgdesc='Advanced PC speaker beeping program, patched so you can run it with sudo'
url='https://github.com/spkr-beep/beep'
arch=('x86_64')
license=('GPL2')
depends=('glibc')
provides=('beep')
conflicts=('beep')
source=(${url}/archive/v${pkgver}/beep-${pkgver}.tar.gz 0001-beep-main.c-yolo-it-when-running-with-sudo.patch 0002-GNUmakefile-fix-install-dir-to-usr.patch)
sha512sums=('18fed77bc4820ecc84ac12e903d516d5228fa2038df1788cc68db76e40b3c47a271911cc45bc48ce94e3f215803c5c05cb6c08ebb47ae6d7fcf1e0bc1ac169cd'
            '18208e0b8817aeb6793423e645932474b098703f042ff07630bb50da7f2b0f3c5c1b180e5f3e89784654cdff0fc4f1d2baca20e4a450f314d583bda9a0c2976f'
            '36f3d54cdf7b4c507834de7db1bfcb46e0c3d9821afc03be024f49925f260a208ef51a6b010015cfc7b46edb83f903bc75a3e3ca8b4819e39a4daeafda16a224')
b2sums=('06f21cf3c40389acca50e6e420af4e738b7484e096bb689345fedb37684b15733dbb38e8a5d0d360f23e020cebe9ba321984ee43f41b0ad980648414ddbb9375'
        '747710350428104c3cef987b4e0170a5396244023851a1fbe0faa4b1ffa8a847b557326bf46eedfffd82cc2c99e3de68e63488e4febbd2ad08566a812643d1d0'
        'b5f5c3960567aa27b9dd61d67ed9b56a64d5c8ff06fccbcc40f3316d9c6e5a7f6341b83412fa76d904c83cc870aa8e36485d6ab70507e64de2787259df77f2fc')

prepare() {
  patch -d "beep-${pkgver}" -Np1 -i "${srcdir}/0001-beep-main.c-yolo-it-when-running-with-sudo.patch"
  patch -d "beep-${pkgver}" -Np1 -i "${srcdir}/0002-GNUmakefile-fix-install-dir-to-usr.patch"
}
build() {
  cd "beep-${pkgver}"
  make
}

package() {
  cd "beep-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
