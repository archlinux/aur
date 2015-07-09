# Maintainer: Yi Dai <plmday_at_gmail_dot_com>

pkgname=flwm-tc
pkgver=1.14
pkgrel=2
pkgdesc="Fast Light Window Manager (an enhanced version by the Tiny Core team)"
arch=('i686' 'x86_64')
url="http://flwm.sourceforge.net/"
license=('GPL')
depends=('fltk')
source=(ftp://distro.ibiblio.org/pub/linux/distributions/tinycorelinux/4.x/x86/release/src/flwm-${pkgver}.tgz
        ${pkgname}-FL_INTERNALS.patch)
md5sums=('95db0e6f37ff04c7d070f02cc3d42799'
         '9a54bf10ff1028e7a32b1a730d7de76d')

build() {
  cd "${srcdir}/flwm-${pkgver}"
  patch -uNp1 < ${startdir}/${pkgname}-FL_INTERNALS.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/flwm-${pkgver}"
  install -Dm755 flwm "${pkgdir}/usr/bin/flwm"
  install -Dm644 flwm.1 "${pkgdir}/usr/share/man/man1/flwm.1"
}

