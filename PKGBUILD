# Maintainer: Jeff Ames <jeff@anjefu.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xdaliclock
pkgver=2.48
pkgrel=2
pkgdesc="An advanced xclock substitute"
arch=(i686 x86_64)
url="https://www.jwz.org/xdaliclock/"
license=('custom')
depends=('gtk3' 'libxext' 'libxt')
source=(https://www.jwz.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4519fe96551a9d784105a8e4306afebe')
sha256sums=('0598aa8d3492020bd3ff9e8e24370a878a433fdbaa561479702c7cf47fb914b4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # License info from https://directory.fsf.org/wiki/Xdaliclock#tab=Details
  cat > LICENSE << eof
All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted, provided that
the above copyright notice appear in all copies and that both that copyright
notice and this permission notice appear in supporting documentation, and that
the name of Solbourne not be used in advertising in publicity pertaining to
distribution of the software without specific, written prior permission.

ANDREAS STOLCKE AND SOLBOURNE COMPUTER INC. DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS, IN NO EVENT SHALL ANDREAS STOLCKE OR SOLBOURNE BE LIABLE FOR ANY
SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING
FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
USE OR PERFORMANCE OF THIS SOFTWARE.
eof

  cd X11
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  cd X11
  install -Dm755 xdaliclock "${pkgdir}/usr/bin/xdaliclock"
  install -Dm644 xdaliclock.man "${pkgdir}/usr/share/man/man1/xdaliclock.1"
  install -Dm644 org.jwz.xdaliclock.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/org.jwz.xdaliclock.gschema.xml"
  install -Dm644 xdaliclock.png "${pkgdir}/usr/share/pixmaps/xdaliclock.png"
  install -Dm755 xdaliclock.desktop "${pkgdir}/usr/share/applications/xdaliclock.desktop"
}
