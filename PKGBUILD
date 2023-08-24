# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tbitsearch-git
pkgver=2.0.0.r6.gdc04b2c
pkgrel=2
pkgdesc="A terminal bitsearch.to frontend."
arch=("x86_64" "aarch64" "i686" "pentium4" "armv7h")
url="https://github.com/georgewoodall82/tbitsearch"
license=('GPL3')
makedepends=('rust' 'git')
depends=('gcc-libs' 'openssl' 'glibc')
source=("tbitsearch::git+https://github.com/georgewoodall82/tbitsearch")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/tbitsearch"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/tbitsearch"
    cargo build --release
}

package() {
    cd "${srcdir}/tbitsearch/target/release"
    install -Dm755 tbitsearch "$pkgdir/usr/bin/tbitsearch"
}
