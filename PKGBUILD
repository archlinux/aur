# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('dspoh')
pkgver=1.0.1
pkgrel=2
options=(!debug)
pkgdesc='Linux tray app that shows DeepSeek peak/off-peak pricing and time until the next change'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/dspoh'
license=('MIT')
makedepends=('cmake' 'gcc' 'pkgconf')
depends=('glibc' 'glib2' 'cairo' 'pango' 'sdl3' 'hicolor-icon-theme')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/dspoh/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '132ec45edb5ba524ee9e066b425e587ecd1126af618795fcba077cd2a9d7f5856cb848566aceb313c93369d46af2867dd89e190c430c1633e23dc5ffe77adbcf'
)

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DDSPOH_VERSION="$pkgver" -B"build" "$srcdir/dspoh-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/dspoh-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
