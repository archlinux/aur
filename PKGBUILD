# Maintainer: xatier
# Contributor: xatier
_pkgname=fcitx5-mcbopomofo
pkgname=fcitx5-mcbopomofo-git
pkgver=2.9.4.r21.30bf6c1
pkgrel=1
pkgdesc="McBopomofo for fcitx5"
arch=('x86_64')
url="https://github.com/openvanilla/fcitx5-mcbopomofo"
license=('MIT')
depends=('fcitx5' 'fmt')
makedepends=('cmake' 'extra-cmake-modules' 'git')
optdepends=()
conflicts=('fcitx5-mcbopomofo')
provides=('fcitx5-mcbopomofo')
source=("${_pkgname}::git+https://github.com/openvanilla/fcitx5-mcbopomofo.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TEST=Off -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir/" install

    # install licence files
    install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/"
}
