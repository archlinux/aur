# Maintainer:
pkgname=luxtrust-middleware
pkgver=1.2.1
pkgrel=1
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
license('custom')
depends=(
  'libclassicclient>=7.2.0_b04'
)
source_i686=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_32bit.tar.gz")
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_64bit.tar.gz")
sha256sums_i686=('79ee2940496ffeed457eefb6b16013a1b5baa4b65f78bfa43411a3675445b579')
sha256sums_x86_64=('487c5f60a8dbb6212e24c41f9b80bf7d845bb13b29f129c96a7c3d070006cb80')

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

  cd "$pkgdir"

  install -D -m 644 opt/LuxTrustMiddleware.desktop \
                    "$pkgdir"/usr/share/applications/LuxTrustMiddleware.desktop
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
