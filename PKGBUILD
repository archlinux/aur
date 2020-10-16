# Maintainer: jojii <jojii@gmx.net>
pkgname=earbuds-git
_pkgname=earbuds
_gitname=LiveBudsCli
pkgver=v0.1.2.r1.g4707ecd
pkgrel=1
pkgdesc="Control your galaxy buds live via cli"
url="https://github.com/JojiiOfficial/LiveBudsCli"
license=("GPL3")
source=("git+$url")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git" "bluez" "bluez-libs" "gcc-libs" "glibc")

pkgver() {
    cd $_gitname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

