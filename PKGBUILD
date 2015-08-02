# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=kdbus-git
_pkgname=kdbus
pkgver=3210.9c04b6b
pkgrel=1
pkgdesc="kdbus kernel module"
arch=('i686' 'x86_64')
url="https://github.com/systemd/kdbus"
depends=( 'dkms' )
provides=("kdbus")
conflicts=("kdbus")
license=('LGPL2.1')
install="kdbus-git.install"
options=(!strip)
source=( "git+$url#branch=v4.1" "dkms.conf" )
sha256sums=('SKIP'
            '61f173310aa99f2f3a4a11590207afe8815a283b8ebfa691626d871425bd8a70')

pkgver() {
  cd "$srcdir/kdbus"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/kdbus"
  rm -fr test
  install -Dm 644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-$pkgver/dkms.conf"
  cp -r * "${pkgdir}/usr/src/${_pkgname}-$pkgver"/
  sed -i "s|@VERSION@|${pkgver}|g" "${pkgdir}/usr/src/${_pkgname}-$pkgver/dkms.conf"
}
