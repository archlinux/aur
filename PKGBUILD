# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr-luarvique
pkgver=0.18.39
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/luarvique/csdr"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
conflicts=('csdr')
provides=('csdr' 'libcsdr++.so=0.18-64')
source=("$pkgname"::"git+https://github.com/luarvique/csdr.git#tag=${pkgver}")
md5sums=('9f1ca9ef4bf30f64054747eef0a761c1')

build() {
    cmake -B build -S "$srcdir/$pkgname" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev

    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
}
