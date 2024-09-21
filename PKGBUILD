# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname="gpg-crypter"
pkgver=0.4.1
pkgrel=5
pkgdesc="A graphical front-end to GnuPG (GPG) using the GTK3 toolkit and libgpgme"
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('intltool')
depends=('glib2' 'glibc' 'gtk3' 'gpgme>=1.1.2')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc}.tar.gz")
b2sums=('21f8becb065cf86d1bc78c169a32e6c7f7918f4a1832f0a5317d423fca9c3b74d078949c97330c41e8051666a29f96b362cdb0ef10a73044ec00bebad17ad480')

build() {
  cd "${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'  
  make
}

package() {
  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
