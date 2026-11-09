# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=sfrename
pkgver=1.3.1
pkgrel=1
pkgdesc="Program for renaming files and directories"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.nongnu.org/small-file-renamer/"
license=('GPL-3.0-or-later')
depends=('gtk3>=3.22.0')
makedepends=('cmake>=3.22' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/sfrename/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d3f68a57092e865dc9627bac632aa7c6def621b7f844c24e10744f5b528bcf0')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        cmake --build build
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
        ctest --test-dir build --output-on-failure
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        DESTDIR="$pkgdir" cmake --install build
}
