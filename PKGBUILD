# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=tunslip
pkgver=3.1
_branch=10d54f228b961d3d8a3d33b925ced361aaa4926f
pkgrel=1
pkgdesc="tools to establish an IPv6 SLIP tunnel interface"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.contiki-os.org/"
license=('BSD')
depends=('glibc')
optdepends=()
source=(https://raw.githubusercontent.com/contiki-os/contiki/${_branch}/tools/tunslip.c
        https://raw.githubusercontent.com/contiki-os/contiki/${_branch}/tools/tunslip6.c
        https://raw.githubusercontent.com/contiki-os/contiki/${_branch}/tools/tools-utils.c
        https://raw.githubusercontent.com/contiki-os/contiki/${_branch}/tools/tools-utils.h
        https://raw.githubusercontent.com/contiki-os/contiki/${_branch}/LICENSE
        gettimeofday.patch
        usage.patch)

sha256sums=('6d1576669121e15c353966450fc7b7f221db674f7f80d679fd19f4ba4878b21f'
            '3e5f96ddd6bd179672922176f16013041f99b218df6f1b7a21f849383869d287'
            '0022ac78fba0530fe2648b0f36a87adb21c455f274ee177073df9b0534867157'
            '7b92e7468fa7d9038d53efb8c4effb05d67e52fc38d26de8f3deb2efdd1bdda8'
            '727c253b4fa0469b6bfa6277269c1503fd4ba8fa2da899903e6c723906ccd5a7'
            '213e1cfc03010e7a43ec3398bf46eca8398f46f946908279d88c93bd49ffda15'
            '010a4cb4ec40abd65c0d7fca018aa1b378d3c6aa463ef383b57a5deb320a321d')

prepare() {
  patch --follow-symlinks -Np1 tunslip.c -i gettimeofday.patch
  patch --follow-symlinks -Np1 -i gettimeofday.patch
  patch --follow-symlinks -Np1 -i usage.patch
}

build() {
  gcc tools-utils.c tunslip6.c -o tunslip
  gcc tools-utils.c tunslip6.c -o tunslip6
}

package() {
  install -D -m755 tunslip "${pkgdir}/usr/bin/tunslip"
  install -D -m755 tunslip6 "${pkgdir}/usr/bin/tunslip6"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
