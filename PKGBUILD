# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=2.1.0
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64 aarch64)
url='https://github.com/39aldo39/libdecsync'
license=('custom:LGPL2')
depends=()
optdepends=()
makedepends=(jre8-openjdk ncurses5-compat-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3e108f6594687d239941d1be0ad86290b63f2fd973b9f3aa8c7a58f51cc18f37')

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
