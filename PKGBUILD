reponame="fcitx5-fbterm"
pkgname="fcitx5-fbterm-git"
pkgver="r3.6d3c949"
pkgrel="1"
pkgdesc="fcitx-fbterm refactor for fcitx5. Fbterm support for fcitx"
arch=("x86_64")
depends=("fcitx5" "fcitx5-gtk")
makedepends=("cmake" "git")
license=("GPL3")
source=("git+https://github.com/fcitx/$reponame")
url="https://github.com/fcitx/$reponame"
sha512sums=("SKIP")
optdepends=("fbterm: fbterm to use fcitx5-fbterm")

pkgver() {
        cd "$reponame"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}


build() {
    cd "$reponame"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "$reponame/build/src/fcitx5-fbterm" "${pkgdir}/usr/bin"
}
