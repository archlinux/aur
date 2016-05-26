# Maintainer:  Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=svrcore
pkgver=4.1.2
pkgrel=1
pkgdesc="Secure PIN handling using NSS crypto"
arch=(i686 x86_64)
license=(MPL)
url="https://pagure.io/svrcore/"
depends=(nspr nss)
options=(!libtool)
source=("http://directory.fedoraproject.org/binaries/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('9d148ec9c568f1183e44006fec83b4e43b0cef56d5a04fce122fab1e9a0c0bfe39919de81c5a4d7adb2258fb7f16b4d327da20cdb4d948810e968c422d62ad40')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static
  if [[ "$CARCH" = 'x86_64' ]]; then
    make USE64=1
  else
    make
  fi
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install 
}
