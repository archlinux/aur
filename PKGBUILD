# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lili1228 <aur at lili dot lgbt>
pkgname=es40
pkgver=0.92.1
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
sha512sums=('0aad4b4027517858b94f9dfb5b8688c685f2ce26b604d4569bf581d1421cd8941701e9c93191e04884707b3d3677b7a29b7058627f44b069c1b5a1e3e33a367e')

build() {
	cmake -Bbuild -S${pkgname}-${pkgver} -DES40_DISABLE_LSS_LSM=on -DES40_DISABLE_IDB=on
	cmake --build build
}

package() {
# cmake --install does nothing
	install -Dt "${pkgdir}/usr/bin" build/es40{,-cfg}
}
