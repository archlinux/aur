# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
# Co-Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github OpenBangla/OpenBangla-keyboard
pkgname="openbangla-keyboard"
pkgver="2.0.0"
pkgrel=5
_riti_sha=1d0dd1cc6cb78bda64219116ef71a63329d627a3
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="http://openbangla.github.io"
license=('GPL3')
depends=('ibus' 'qt5-base')
makedepends=('cmake' 'rust')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="$pkgname.install"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/OpenBangla/OpenBangla-keyboard/archive/$pkgver.tar.gz"
    "riti.zip::https://github.com/OpenBangla/riti/archive/${_riti_sha}.zip"
)
sha256sums=('29e8cfbdc913832ede040adcf623b59cc47e92e12d5cfd995dd40cf5d6906b6a'
            '942c9315ee90fe5313797118e76fbf995b453dd97c13f2fbbe7cb63820bc7398')

prepare() {
    rmdir "OpenBangla-Keyboard-$pkgver/src/engine/riti"
    ln -s "../../../riti-${_riti_sha}" "OpenBangla-Keyboard-$pkgver/src/engine/riti"
}
build() {
    cd "$srcdir/OpenBangla-Keyboard-$pkgver"
    if [[ -d build ]]; then rm -rf build; fi
    mkdir build && cd build
    cmake ..
    make
}
package() {
    cd "$srcdir/OpenBangla-Keyboard-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
