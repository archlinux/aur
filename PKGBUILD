# Maintainer: Joshix
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
_pkgbase=dash
pkgver=0.5.13.5
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
sha512sums=('ae326c110713a9da6b7afb977ca6fd931793b03011f0a7aa2c42e873f116ed09448deea9ef5ca4515fe3afe24e210e0aaa580f7de89934edda9cf31ee44c94dd')


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
