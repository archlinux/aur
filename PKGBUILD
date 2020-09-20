# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=xboot
pkgver=2.0.1
pkgrel=2
pkgdesc="The extensible bootloader for embedded system with application engine, write once, run everywhere. (Linux Sandbox for x86_64)"
arch=('x86_64')
url="https://github.com/xboot/xboot"
license=('MIT')
depends=('sdl2')
provides=("${pkgname}-sandbox")
conflicts=("${pkgname}-sandbox")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/xboot/${pkgname}/archive/v${pkgver}.tar.gz"
        LICENSE::"https://raw.githubusercontent.com/xboot/${pkgname}/master/LICENSE")

sha256sums=('13d32fa8c199ff8f2755543996f6c74ab7f00909834090a01b39f706ce10b799'
            'd4ed4081798ef8b11b60e0464f51d451138ca3752104b4972d9d30cc4a15c94e')

build() {
  cd ${pkgname}-${pkgver}

  make CROSS_COMPILE="" PLATFORM=x64-sandbox
}

package() {
  cd ${pkgname}-${pkgver}

  # binary
  install -Dm755 output/${pkgname}  ${pkgdir}/usr/bin/${pkgname}

  # LICENSE
  install -Dm644 ${srcdir}/LICENSE  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
