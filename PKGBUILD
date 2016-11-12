# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Simon Malinge <tapi@syskall.net>

pkgname=rats
pkgver=2.4
pkgrel=1
pkgdesc='Tool for scanning source code and flagging common security related programming errors'
url='https://code.google.com/p/rough-auditing-tool-for-security/'
license=('GPL2')
depends=('expat')
arch=('i686' 'x86_64')
options=('!emptydirs')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rough-auditing-tool-for-security/rats-${pkgver}.tgz)
sha512sums=('f402717fc935a2f9c2464e1623807575044258fd998cabc8f115c063141004b5978bad739021f109cbbd1abd84231155eb59671ae202aefb40e1fd6733d8ac6d')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's/$(BINDIR)/$(DESTDIR)$(BINDIR)/g' -i Makefile.in
  sed -e 's/$(MANDIR)/$(DESTDIR)$(MANDIR)/g' -i Makefile.in
  sed -e 's/ $(LIBDIR)/ $(DESTDIR)$(LIBDIR)/g' -i Makefile.in
  sed -e 's/ $(SHAREDIR)/ $(DESTDIR)$(SHAREDIR)/g' -i Makefile.in
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make SHAREDIR="/usr/share/${pkgname}"
}

package() {
  cd ${pkgname}-${pkgver}
  make MANDIR="/usr/share/man" \
    SHAREDIR="/usr/share/${pkgname}" \
    DESTDIR="${pkgdir}" \
    install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
