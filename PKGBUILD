# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: nemanjan00 <nemanjan00@gmail.com>

pkgname=dsd-fme
pkgver=20260715
pkgrel=1
pkgdesc="Digital Speech Decoder - Florida Man Edition"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lwvmobile/dsd-fme.git"
license=('LicenseRef-custom')
install="$pkgname.install"
depends=(
    'libpulse'
    'ncurses'
    'rtl-sdr'
    'fftw'
    'codec2'
    'libsndfile'
    'itpp'
    'mbelib'
    'glibc'
    'gcc-libs'
    'libogg'
    'libvorbis'
    'flac'
    'lapack'
    'opus'
    'mpg123'
    'lame'
    'blas'
    'libusb'
    'dbus'
    'libxcb'
    'systemd-libs'
    'libasyncns'
    'libxau'
    'libxdmcp'
    'libcap'
    'lz4'
    'xz'
    'zstd'
    'libgpg-error'
)
optdepends=('pulseaudio: use pulse as audio input device')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lwvmobile/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('26705d79c9e9e0376078fe0e610af7548b47abd37f320b099b10b84ea4b5d436')

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install

    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
