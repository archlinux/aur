# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar
pkgver=1.7.0
pkgrel=1
epoch=
pkgdesc="Command line utility to mirror container images"
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://github.com/cnrancher/hangar"
license=("Apache")
conflicts=("hangar-bin" "hangar-git")
depends=(
    "gpgme"
    "device-mapper"
    "containers-common"
)
makedepends=(
    "go"
    "git"
    "btrfs-progs"
)
provides=()
source=("git+$url#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/hangar"
    go mod tidy && go mod verify
}

build() {
    cd "${srcdir}/hangar"
    ./scripts/build.sh
}

package() {
    cd $srcdir
    install -Dm755 "${srcdir}/hangar/bin/hangar" "${pkgdir}/usr/bin/hangar"
    install -Dm644 "${srcdir}/hangar/LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
