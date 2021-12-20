# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=2.2.1
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64 aarch64)
url='https://github.com/39aldo39/libdecsync'
license=('custom:LGPL2')
depends=(gcc-libs)  # libdecsync.so depends on libgcc_s.so.1
optdepends=()
makedepends=(jre8-openjdk ncurses5-compat-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3e08b35efed3bafb079aa52a8dcd51217f6602cde64accba1a10cf5c25029d45')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # For some reason, make exits with status 2 even if the build succeeded.
    env -u _JAVA_OPTIONS JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre make || :
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
