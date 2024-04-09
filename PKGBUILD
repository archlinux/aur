# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch-git
pkgver=v0.1.0.r5.gc3d58e3
pkgrel=1
pkgdesc="A highly configurable command-line fetch tool thats also performant."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("$pkgname::git+https://github.com/LivacoNew/CrabFetch")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
    # verbose in case issues arise, makes debugging step instant
    cargo build -rv
}

package() {
	cd "${srcdir}/${pkgname}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/bin/crabfetch
}
