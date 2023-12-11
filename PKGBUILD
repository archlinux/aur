# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-git
pkgver=v1.7.0.r0.gcfb8182
pkgrel=1
epoch=
pkgdesc="Command line utility to mirror container images"
arch=("x86_64")
url="https://github.com/cnrancher/hangar"
license=("Apache")
conflicts=("hangar-bin")
depends=(
    "gpgme"
    "device-mapper"
    "containers-common"
)
makedepends=(
    "go"
    "git"
)
provides=()
source=('git+https://github.com/cnrancher/hangar.git')
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/hangar"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
