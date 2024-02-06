# Maintainer: Yorick Peterse <aur@yorickpeterse.com>
pkgname=git-clogs
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate a changelog from Git commits containing trailers"
url="https://github.com/yorickpeterse/clogs"
license=(MPL2)
arch=(x86_64)
depends=(git)
makedepends=(inko)
provides=(clogs)
conflicts=()
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/yorickpeterse/clogs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23951c1453dfa6379588a95ea05cba9284bdb9ceb32a60be187c466e77ee1672')

build() {
    cd "clogs-${pkgver}"
    inko pkg sync
    inko build -o ./build/clogs
}

package() {
    cd "clogs-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" ./build/clogs
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
