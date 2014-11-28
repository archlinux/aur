# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=geo
pkgver=141025181953
pkgrel=1
pkgdesc="Various tools for geocaching"
arch=('i686' 'x86_64')
url="http://geo.rkkda.com/"
license=('Public Domain')
depends=('bc' 'curl' 'perl' 'units' 'gpsbabel')
makedepends=('ghostscript' 'hd2u' 'sharutils' 'txt2man')
optdepends=('gpsd: for GPS management'
            'gpsdrive: for GPS management'
            'tangogps: for GPS management'
            'viking: for GPS management')
source=(http://geo.rkkda.com/$pkgname-14-10-25-18-19-53.tar.gz
        geo-install-patch.diff)
sha256sums=('1cb96c11a18e46357e5c6c8d92cd19e12ce2c69a7e85f382f8666e6762887b08'
            '7996a998a0ce23764e870e1f63dd76a067488fe90e54d3955caf33623994cf8c')

build() {
  cd "${srcdir}"/$pkgname

  make
}

package(){
  cd "${srcdir}"/$pkgname

  patch -Np0 -i "${srcdir}"/geo-install-patch.diff

  install -d "${pkgdir}"/usr/bin
  make PREFIX="${pkgdir}"/usr install

#more tools
  install -D -m644 "${srcdir}"/$pkgname/geodetics.html \
    "${pkgdir}"/usr/share/doc/$pkgname/geodetisc.html
  install -D -m644 "${srcdir}"/$pkgname/greatcircle.html \
    "${pkgdir}"/usr/share/doc/$pkgname/greatcircle.html

#man pages
  install -d "${pkgdir}"/usr/share/man/man{1,7}
  make PREFIX="${pkgdir}"/usr install-man
}
