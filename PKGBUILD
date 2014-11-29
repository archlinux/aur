# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=cstools
pkgver=3.42
pkgrel=3
pkgdesc="Tools for dealing with Czech texts in Perl"
arch=('any')
url="https://metacpan.org/release/Cstools"
license=('custom')
depends=('perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/J/JA/JANPAZ/Cstools-$pkgver.tar.gz)
md5sums=('ea18f2a24ef5de92483a5e03ed9d2659')

build() {
  cd "${srcdir}"/Cstools-$pkgver
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}"/Cstools-$pkgver
  make test
}

package() {
  cd "${srcdir}"/Cstools-$pkgver
  make DESTDIR="${pkgdir}" install

#license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}/
  sed '84,86p;d' README > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
