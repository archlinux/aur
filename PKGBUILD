# Maintainer: 

pkgname=luxtrust-middleware
pkgver=1.1.0
pkgrel=1
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
depends=(
  'libclassicclient>=7.2.0_b04'
)
source=("https://www.luxtrust.lu/downloads/middleware/eula.pdf")
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_64bit.tar.gz")
sha256sums=('4c9b71b596900700cdbf8f1515df44d9383fd5f336114e38cebfffc30d74f564')
sha256sums_i686=('771195d2cd48a56ee70b2826fa1c008fed8925ad29dddd46fff155e6d474e775')
sha256sums_x86_64=('e1f77f5c1eaa479395a62106db0ec4b3aa0df45d428ebe790982159ec6f55283')

prepare() {
  cd "$srcdir"

  case $CARCH in
    i686)
      bsdtar -xf luxtrust-middleware-${pkgver}-32.deb;;
    x86_64)
      bsdtar -xf luxtrust-middleware-${pkgver}-64.deb;;
  esac

  bsdtar -xf data.tar.xz
}

package() {
  cd "$srcdir"

  cp -a opt "$pkgdir"/

  install -D -m 644 opt/LuxTrustMiddleware.desktop \
                    "$pkgdir"/usr/share/applications/LuxTrustMiddleware.desktop
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
