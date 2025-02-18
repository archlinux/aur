# Maintainer: Yorick Peterse
pkgname=git-clogs
pkgver=0.9.0
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
sha256sums=('7e02c2431af549b5a99cd854ce4646ebfdd631c27315fb2f24e5c085adf07081')

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
