# Contributor: noonov <noonov@gmail.com>

pkgname=nkf
pkgver=2.1.4
pkgrel=1
pkgdesc="A yet another kanji code converter among networks, hosts and terminals"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/nkf/"
license=('custom:zlib')
depends=('glibc')
source=(http://dl.sourceforge.jp/nkf/64158/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b4175070825deb3e98577186502a8408c05921b0c8ff52e772219f9d2ece89cb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  sed -i "/^CFLAGS/s|$| ${CFLAGS}|" Makefile

  make
  ./nkf -w --overwrite nkf.1j
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -D -m755 nkf    ${pkgdir}/usr/bin/nkf
  install -D -m644 nkf.1  ${pkgdir}/usr/share/man/man1/nkf.1
  install -D -m644 nkf.1j ${pkgdir}/usr/share/man/ja/man1/nkf.1
}
