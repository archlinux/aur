# Maintainer: Joshix
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
_pkgbase=dash
pkgver=0.5.13.4
pkgrel=1
pkgdesc="POSIX compliant shell that aims to be as small as possible. Statically compiled"
arch=('x86_64' 'aarch64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
makedepends=('gcc' 'make' 'gzip')
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz")
# http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz.sha512sum
sha512sums=('383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675')


build () {
  cd "dash-${pkgver}"
  ./configure --enable-static
#    --with-libedit # disabled libedit for now
  make
  gzip -f -k9 src/dash.1
}

package() {
  cd "dash-$pkgver"
  install -Dm755 src/dash "${pkgdir}/usr/bin/dash"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING"
  install -Dm644 src/dash.1.gz "${pkgdir}/usr/share/man/man1/dash.1.gz"
}
