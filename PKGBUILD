# Maintainer: Joshix
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
_pkgbase=dash
pkgver=0.5.13.3
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
sha512sums=('4f463ea9d9bd72cb9852578a43ce04a211e2e775782f4cb6b2af328d51f80fcf9cff3255c519f60027f7b0d8b9d3c9ebed100925bf6324bbef81381ebd3c77ae')


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
