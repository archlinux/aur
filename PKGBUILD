# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lili1228 <aur at lili dot lgbt>
pkgname=es40
pkgver=0.75.4
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
sha512sums=('2b0716d2508b1aae1e60c9585639be14aff8af97aedf8167a3ead06289ebacdc463130eb6d3b873a62a2f2c7d30741a7585efc1a98342bbd315b9227c206449e')

build() {
	cmake -Bbuild -S${pkgname}-${pkgver} -DES40_DISABLE_LSS_LSM=on -DES40_DISABLE_IDB=on
	cmake --build build
}

package() {
# cmake --install does nothing
	install -Dt "${pkgdir}/usr/bin" build/es40{,-cfg}
}
