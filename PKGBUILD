# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=inform7
pkgver=6M62
pkgrel=1
pkgdesc="A design system for interactive fiction based on natural language"
arch=('i686' 'x86_64')
url="http://inform7.com/"
license=('custom:Inform')
depends=('perl')
source=("http://inform7.com/download/content/${pkgver}/I7_${pkgver}_Linux_all.tar.gz"
        "install-inform7.sh.patch"
        "LICENSE")
md5sums=('db5c81436cc908f5fad77cc0b59a9ff2'
         '647052976b3870e975e069f71f770d20'
         'a18958ae17bcc3733119cad77376eec5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/install-inform7.sh.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./install-inform7.sh -p "$pkgdir/usr"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
