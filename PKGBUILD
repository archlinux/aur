# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname='html2text-with-utf8'
_pkgname='html2text'
pkgver='1.3.2a'
pkgrel='1'
pkgdesc='A HTML to text converter with utf-8 patch'
arch=('i686' 'x86_64')
url='http://www.mbayer.de/html2text'
license=('GPL2')
depends=('gcc-libs')
conflicts=('html2text')
source=("http://www.mbayer.de/html2text/downloads/${_pkgname}-${pkgver}.tar.gz"
  "http://www.mbayer.de/html2text/downloads/patch-utf8-${_pkgname}-${pkgver}.diff")
sha256sums=('000b39d5d910b867ff7e087177b470a1e26e2819920dcffd5991c33f6d480392'
            'be4e90094d2854059924cb2c59ca31a5e9e0e22d2245fa5dc0c03f604798c5d1')

build() {
  cp -p "${srcdir}/patch-utf8-${_pkgname}-${pkgver}.diff" "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 < 'patch-utf8-html2text-1.3.2a.diff'

  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 'html2text' "${pkgdir}/usr/bin/html2text"
  install -Dm644 'html2text.1.gz' "${pkgdir}/usr/share/man/man1/html2text.1.gz"
  install -Dm644 'html2textrc.5.gz' "${pkgdir}/usr/share/man/man5/html2textrc.5.gz"
}
