# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=find-cursor
pkgver=1.8
pkgrel=1
pkgdesc="Simple XLib program to highlight the cursor position in X11"
arch=('x86_64')
url="https://github.com/arp242/find-cursor"
license=('MIT')
depends=(libx11 libxext libxcomposite libxrender libxdamage)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        0001-specify-the-libraries-after-source-files.patch)
sha256sums=('2718ba5c65fe9b6a5a6e02989eba4ebacce1b9536e82896ac67f25203d7554bb'
            '4bd02c0073d1e67af2ae5be6d2b6e7ac5376ea825ff97bfe0f7c4a792de6e766')

prepare() {
    cd "$srcdir/find-cursor-$pkgver"
    patch --strip=1 -i "$srcdir"/0001-specify-the-libraries-after-source-files.patch
}

build() {
    cd "$srcdir/find-cursor-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/find-cursor-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
