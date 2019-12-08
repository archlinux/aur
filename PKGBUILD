# Maintainer: Andreas Schulz <andi.schulz@me.com>

pkgname=qtcreator-plugin-tabs-git
pkgver=r27.9fec48c
pkgrel=1
pkgdesc="Tabs for Qt Creator."
arch=('x86_64')
url="https://github.com/Longhanks/qtcreator-plugin-tabs"
license=('MIT')
depends=('qtcreator' 'qtcreator-plugin-layoutsupport-git')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/Longhanks/qtcreator-plugin-tabs.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {        
    cd build

    cmake "$srcdir/$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQTCREATOR_SRC="/usr/src/qtcreator" \
        -DQTCREATOR_BIN="/usr/bin/qtcreator"
        
    make
}

package() {
    cd build

    make DESTDIR="$pkgdir/" install

    install -D -m644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
