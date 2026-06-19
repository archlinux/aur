# Maintainer: a821 at mail de

pkgname=libpathrs
pkgver=0.2.5
pkgrel=1
pkgdesc="C-friendly API to make path resolution safer on Linux"
arch=(x86_64)
url="https://github.com/cyphar/libpathrs"
license=('MPL-2.0 OR LGPL-3.0-or-later')
depends=(glibc libgcc)
makedepends=(cargo)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('C9C370B246B09F6DBCFC744C34401015D1D2D386') # Aleksa Sarai <cyphar@cyphar.com>
sha256sums=('f8f4a9419eb839cd5decbd120b65f0495bf6eac07155477fe39a8c2a23da589d'
            'SKIP')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    make --jobs=1 release
}

package() {
    cd "$pkgname-$pkgver"
    ./install.sh DESTDIR="$pkgdir" --prefix=/usr --lib=/usr/lib
}
