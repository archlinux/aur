# Maintainer: Oliver Anhuth <oliver.anhuth at zoho.com>

pkgname=envview
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple graphical viewer for (inherited) environment variables"
arch=("i686" "x86_64")
url="https://github.com/oliver-anhuth/envview"
license=("MIT")
depends=("qt5-base")
makedepends=("qt5-base" "gcc-multilib")
source=("$pkgname-$pkgver.tar.gz::https://github.com/oliver-anhuth/envview/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # Adjust version in source code
    mv main_window.cpp tmp-393d8225-f69f-47e2-b55f-76b57c91373a
    sed "s/version = \".....\"/version = \"$pkgver\"/" \
            tmp-393d8225-f69f-47e2-b55f-76b57c91373a >main_window.cpp
    rm tmp-393d8225-f69f-47e2-b55f-76b57c91373a
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make -f install.make DESTDIR="${pkgdir}" install
}
