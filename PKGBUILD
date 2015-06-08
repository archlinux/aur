# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=rtl8723bs-dkms-git
pkgver=1
pkgrel=1
pkgdesc="Realtek 8723bs SDIO Wi-Fi drive"
arch=('any')
url="https://github.com/hadess/rtl8723bs"
license=('GPL')
depends=('dkms')
makedepends=('git')
options=(!strip)
install=install
source=(git+https://github.com/hadess/rtl8723bs.git
        'dkms.conf')
md5sums=('SKIP'
         'fa5b2a18993ba29ed222b19180dbb29d')

pkgver() {
  expr $pkgver + 1
}

build() {
  sed -i "2cPACKAGE_VERSION=$pkgver" dkms.conf
}

package() {
  local P="$pkgdir/usr/src/rtl8723bs-$pkgver"
  install -m755 -d "$P"
  cp -r rtl8723bs/* "$P"
  chmod u=rwX,go=rX -R "$P"
  install -Dm644 dkms.conf "$P/dkms.conf"
}

# vim:set ts=2 sw=2 et:
