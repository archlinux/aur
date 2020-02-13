# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=pcal
pkgver=4.11.0
pkgrel=6
pkgdesc="Generate annotated PostScript or HTML calendars in a monthly or yearly format"
url="http://pcal.sourceforge.net/"
license=('unknown')
arch=('x86_64' 'armv7h')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tgz")
sha1sums=('214bcb4c4b7bc986ae495c96f2ab169233a7f973')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}"/usr/{bin,share/doc/$pkgname,share/{man1,cat1}}
  install -D doc/pcal-* doc/ReadMe.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r examples html scripts "${pkgdir}/usr/share/doc/${pkgname}/"

  # Note the usage of $PACK, because the Makefile uses "compress" by
  # default, which doesn't exist on Arch. Besides, makepkg handles
  # manpage compression itself.
  make \
    PACK=":" \
    DESTDIR="${pkgdir}" \
    BINDIR="/usr/bin" \
    MANDIR="/usr/share/man/man1" \
    CATDIR="/usr/share/man/cat1" \
    install
}
