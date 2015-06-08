# Contributor: noonov <noonov@gmail.com>

pkgname=nkf
pkgver=2.1.3
pkgrel=1
pkgdesc="A yet another kanji code converter among networks, hosts and terminals"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/nkf/"
license=('custom:zlib')
depends=('glibc')
source=(http://dl.sourceforge.jp/nkf/59912/${pkgname}-${pkgver}.tar.gz)
md5sums=('fb234b60f039f8df1c6b96a4287771ff')
sha256sums=('8cb430ae69a1ad58b522eb4927b337b5b420bbaeb69df255919019dc64b72fc2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  sed -i "/^CFLAGS/s|$| ${CFLAGS}|" Makefile

  make
  #./nkf -w --overwrite nkf.1j
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -D -m755 nkf    ${pkgdir}/usr/bin/nkf
  install -D -m644 nkf.1  ${pkgdir}/usr/share/man/man1/nkf.1
  # Japanese manpage is broken in 2.1.3
  #install -D -m644 nkf.1j ${pkgdir}/usr/share/man/ja/man1/nkf.1
}
