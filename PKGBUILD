# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lili1228 <aur at lili dot lgbt>
pkgname=es40
pkgver=0.76
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
sha512sums=('378ff036cf53fc0eff8f05c098da86a16e2bca7b354babaa1d97b0f101fa7f34a0e995409e11c71b766c05c22a754c6a1df5dc2d99e7d9c37e1725a1aaeb9e7c')

build() {
	cmake -Bbuild -S${pkgname}-${pkgver} -DES40_DISABLE_LSS_LSM=on -DES40_DISABLE_IDB=on
	cmake --build build
}

package() {
# cmake --install does nothing
	install -Dt "${pkgdir}/usr/bin" build/es40{,-cfg}
}
