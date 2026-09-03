# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('dspoh')
pkgver=1.0.0
pkgrel=1
options=(!debug)
pkgdesc='Linux tray app that shows DeepSeek peak/off-peak pricing and time until the next change'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/dspho'
license=('MIT')
makedepends=('cmake' 'gcc' 'pkgconf')
depends=('glibc' 'glib2' 'cairo' 'pango' 'sdl3')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/dspho/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'ba93aec7471d9c710136175685291daf8bed5f17eb8743ed0c6a6cc23bada8048d573ae6596c893adc7e615f6d2bd3fa3beac838fe46781787cf61ba2a09c6cd'
)

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -B"build" "$srcdir/dspho-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/dspho-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
