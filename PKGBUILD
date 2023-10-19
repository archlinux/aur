# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=rutoken
pkgver=2.11.0.0
pkgrel=1
pkgdesc="Support for cryptographic tokens from Aktiv-Soft JSC"
url="https://www.rutoken.ru/support/download/"
arch=('x86_64')
license=("custom")
depends=("glibc" "gcc-libs" "pcsclite" "ccid")
options=('!strip')
source=("https://download.rutoken.ru/Rutoken/Utilites/rtAdmin/2.4/Linux/rtadmin.zip"
        "https://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp-${pkgver}-1.x86_64.rpm"
        "sd-rutoken")
sha256sums=('e1f9673a79212daba215b2421e6003e2ddb36edb247922e0941122e36901832b'
            '6b7a9cf5f84ebc339232f5a8e3be076cb12fd996491fb6bca4f099461198394c'
            'SKIP')

package() {
  bsdtar -xf "${srcdir}/linux-x64.zip"
  install -Dm755 "linux-x64/rtadmin" "$pkgdir/usr/bin/rtadmin"

  install -Dm755 "opt/aktivco/rutokenecp/x86_64/librtpkcs11ecp.so" "$pkgdir/usr/lib/pkcs11/librtpkcs11ecp.so"
  install -Dm644 "usr/share/doc/librtpkcs11ecp/LICENSE" "$pkgdir/usr/share/doc/librtpkcs11ecp/LICENSE"
  install -Dm644 "usr/share/doc/librtpkcs11ecp/NOTICE.txt" "$pkgdir/usr/share/doc/librtpkcs11ecp/NOTICE"

  mkdir -p "$pkgdir/usr/share/p11-kit/modules"
  echo "module: librtpkcs11ecp.so" > "$pkgdir/usr/share/p11-kit/modules/rutoken.module"

  install -Dm644 "sd-rutoken" "$pkgdir/usr/lib/initcpio/install/sd-rutoken"
}
