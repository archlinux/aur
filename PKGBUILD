# Maintainer: javalsai <javalsai@proton.me>
pkgname=paralload-git
pkgver=1.1.2.r8.gc40afe2
pkgrel=1
depends=('libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')
makedepends=('git' 'go')
pkgdesc="A download tool that uses multiple HTTP(S) connections and byte ranges"
arch=('any')
url="https://github.com/ErrorNoInternet/Paralload"
license=('GPL')
provides=('paralload')
conflicts=('paralload')
source=("paralload::git+https://github.com/ErrorNoInternet/Paralload")
sha256sums=('SKIP')

pkgver() {
    cd "paralload"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "paralload"
    go build
}

package() {
    cd "paralload"
    install -Dm755 paralload "${pkgdir}/usr/bin/paralload"
}
