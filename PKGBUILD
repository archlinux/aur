# Maintainer:  Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=xplot
pkgver=0.90.7.1
pkgrel=7
pkgdesc="Reads from a xpl file to generate plots"
arch=('x86_64')
url="http://www.xplot.org/"
license=('MIT')
depends=('libx11' 'perl')
source=("http://www.xplot.org/xplot/$pkgname-$pkgver.tar.gz")
md5sums=('755e32f8ae429f1c546fdeee7c28c92e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="${pkgdir}/usr"
  sed -e "s|mandir = \$(exec_prefix)/man/man1|mandir = \$(exec_prefix)/share/man/man1|" -i Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  sed -n '2,31p' "${srcdir}/${pkgname}-${pkgver}/xplot.c" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
