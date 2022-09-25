# Maintainer:
pkgname=luxtrust-middleware
pkgver=1.8.0
pkgrel=1
pkgdesc="LuxTrust Middleware - Gemalto PKCS#11 driver"
url="https://www.luxtrust.com/en/middleware"
arch=(x86_64)
depends=(
  'libclassicclient>=7.5.0_b02.00'
)
source_x86_64=("https://www.luxtrust.com/sites/default/files/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_64bit.tar.gz")
sha256sums_x86_64=('003f23e06ad4960b4406b64d26ab72aa92877c56c8b4a9dfe16e14a17975740f')

prepare() {
  cd "$srcdir"

  case $CARCH in
    x86_64)
      bsdtar -xf luxtrust-middleware-${pkgver}-64.deb;;
  esac

  bsdtar -xf data.tar.xz
}

package() {
  cd "$srcdir"

  cp -a opt "$pkgdir"/

  cd "$pkgdir"
  echo "$pkgdir"

  install -D -m 644 opt/LuxTrustMiddleware/LuxTrustMiddleware.desktop \
                    "$pkgdir"/usr/share/applications/LuxTrustMiddleware.desktop
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
