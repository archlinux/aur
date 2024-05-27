# Maintainer: Zack Didcott

pkgname=pongoterm-git
pkgver=2.5.1.r28.g4c9b754
pkgrel=1
pkgdesc="Interactive shell client for PongoOS from checkra1n."
arch=("any")
url="https://checkra.in/"
license=("MIT")
optdepends=("checkra1n-cli: semi-tethered jailbreak")
provides=("pongoterm")
conflicts=("pongoterm")
source=("${pkgname}::git+https://github.com/checkra1n/PongoOS.git")
b2sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}/scripts"
    make pongoterm
}

package() {
    cd "${pkgname}/scripts"
    install -Dm755 "pongoterm" "${pkgdir}/usr/bin/pongoterm"
}