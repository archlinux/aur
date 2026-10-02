# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lili1228 <aur at lili dot lgbt>
pkgname=es40
pkgver=0.88
pkgrel=1
pkgdesc='AlphaServer ES40 emulator'
arch=('x86_64' 'aarch64') # aarch64 not tested but there's a macOS version
url='https://github.com/ES40-Emu/es40'
license=('GPL-2.0-or-later')
depends=('libpcap' 'sdl3' # explicit
'glibc' 'libgcc' 'libstdc++') # implicit
makedepends=('cmake>=3.24' 'git' 'libxt')
provides=('es40')
conflicts=('es40')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ES40-Emu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2f12bd27f203b82ca59dacdedcc594c4d87f2571b21913a708cd49564871c09087200e111c665a70d2e64e1f176f14da0ae5ab8cf22356464c21de14b64e252c')

build() {
	cmake -Bbuild -S${pkgname}-${pkgver} -DES40_DISABLE_LSS_LSM=on -DES40_DISABLE_IDB=on
	cmake --build build
}

package() {
# cmake --install does nothing
	install -Dt "${pkgdir}/usr/bin" build/es40{,-cfg}
}
