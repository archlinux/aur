# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=cstools
pkgver=3.44
pkgrel=1
pkgdesc="Tools for dealing with Czech texts in Perl"
arch=('any')
url="https://metacpan.org/release/Cstools"
license=('custom')
depends=('perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/J/JA/JANPAZ/Cstools-$pkgver.tar.gz)
sha256sums=('20e1cf25187ba6aa3b3b657beeb1c09f5f4310afef30804a5dcf1f04ee055b2b')

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
