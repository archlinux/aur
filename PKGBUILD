# Maintainer:  Andreas Baumann <mail () andreasbaumann () cc>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname="mp3splt"
pkgver=2.6.2
pkgrel=4
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('x86_64')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.2')
provides=('flacsplt' 'oggsplt')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz")
sha512sums=('c1cbdc905d4f19e8e20afeadf02a2967049d86e69613312c8855e03afc5b190a569ac63f970171384853961cbe6bf248fae47e5116c4fe9deb7a0787f299918b')

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-oggsplt_symlink \
    --enable-flacsplt_symlink
  make
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
