# Maintainer: gudzpoz <gudzpoz at live dot com>

pkgname=apl-bin
pkgver=2.0
_deb_pkgrel=1
pkgrel=1
pkgdesc="GNU APL interpreter and library for array programming (ISO 13751)"
arch=('x86_64')
url="https://www.gnu.org/software/apl/"
license=('GPL-3.0-or-later')
makedepends=('patchelf')
depends=('glibc' 'gcc-libs' 'ncurses' 'cairo' 'fftw' 'gtk3' 'pcre2' 'libpng' 'sqlite3' 'libx11' 'libxcb' 'postgresql-libs')
provides=('apl' 'gnu-apl')
conflicts=('apl' 'gnu-apl')
source=("https://ftpmirror.gnu.org/gnu/apl/apl_${pkgver}-${_deb_pkgrel}_amd64.deb")
sha256sums=('eb09ce5761a8c989f1993d451200527a3ebf0f253543e1aaf8fbe53b6a9bdb7b')

package() {
  bsdtar -xf "${srcdir}"/data.tar.zst -C "${pkgdir}/"

  patchelf --replace-needed libgsl.so.27 libgsl.so.28 "$pkgdir/usr/bin/apl"
}
