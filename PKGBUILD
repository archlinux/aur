# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=es40-git
pkgver=0.74.r14.g76b5d7c
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
source=("$pkgname::git+https://github.com/ES40-Emu/es40.git")
sha512sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -Bbuild -S$pkgname -DES40_DISABLE_LSS_LSM=on -DES40_DISABLE_IDB=on
	cmake --build build
}

package() {
# cmake --install does nothing
	install -Dt "$pkgdir/usr/bin" build/es40{,-cfg}
}
