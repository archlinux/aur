# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=cmake-pkg
pkgver=0.0.2
pkgrel=1
pkgdesc="pkg-config clone for CMake."
arch=('any')
url='https://gitlab.com/yataro/cmake-pkg/'
license=('MIT')
depends=('cmake')
makedepends=('zig')

source=("https://gitlab.com/yataro/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('438a1f0d1bb51e7fa31214894917bcc4998ae28fdc494be9c9f36177a08dced2')



build() {
    cd "$pkgname-v$pkgver"

    DESTDIR="build" zig build                   \
        --summary all                           \
        --global-cache-dir ../zig-global-cache  \
        --prefix /usr                           \
        --release=safe                          \
        -Dtarget=native-linux.6.1-gnu.2.38      \
        -Dcpu=baseline
}

package() {
    cd "$pkgname-v$pkgver"

    cp -a build/* "$pkgdir"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
