# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.31.3.r2.g1477c08
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories (git)'
arch=(i686 x86_64)
url=https://www.jdupes.com
license=(MIT)
depends=(glibc libjodycode-git xxhash)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://codeberg.org/jbruchon/jdupes.git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    make EXTERNAL_HASH_LIB=1 LDFLAGS_EXTRA=-lxxhash
}

package() {
    cd "${pkgname%-git}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
