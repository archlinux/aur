# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=geo
pkgver=160818134729
pkgrel=1
pkgdesc="Various tools for geocaching"
arch=('i686' 'x86_64')
url="http://geo.rkkda.com/"
license=('Public Domain')
depends=('bc' 'curl' 'perl' 'units' 'gpsbabel')
makedepends=('ghostscript' 'dos2unix' 'sharutils' 'txt2man')
optdepends=('gpsd: for GPS management'
            'gpsdrive: for GPS management'
            'foxtrotgps: for GPS management'
            'viking: for GPS management')
source=(http://geo.rkkda.com/$pkgname-16-08-18-13-47-29.tar.gz
        geo-install-patch.diff)
sha256sums=('7c30227633f4fbd9f03d3a716d166cf58914d3e91057e78b486bf090b4aa3b54'
            'e50e8d05c3f845c4e6667eb3b76f7c757353d9a1df720bda8b687a1a430e1bc4')

prepare() {
  cd "${srcdir}"/$pkgname
  patch -Np0 -i "${srcdir}"/geo-install-patch.diff
}

build() {
  cd "${srcdir}"/$pkgname
  make
}

package(){
  cd "${srcdir}"/$pkgname

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
