# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=kdbus-git
_pkgname=kdbus
pkgver=2131.db51839
pkgrel=2
pkgdesc="kdbus kernel module"
arch=('i686' 'x86_64')
url="https://code.google.com/p/d-bus/"
depends=( 'dkms' )
provides=("kdbus")
conflicts=("kdbus")
license=('LGPL2.1')
install="kdbus-git.install"
options=(!strip)
source=( "git+https://code.google.com/p/d-bus/" "dkms.conf" )
md5sums=('SKIP' 'a36446ca25771bfd800dc03aaddef968')

pkgver() {
  cd "$srcdir/d-bus"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/d-bus"
  rm -fr test
  install -Dm 644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-$pkgver/dkms.conf"
  cp -r * "${pkgdir}/usr/src/${_pkgname}-$pkgver"/
  sed -i "s|@VERSION@|${pkgver}|g" "${pkgdir}/usr/src/${_pkgname}-$pkgver/dkms.conf"
}
