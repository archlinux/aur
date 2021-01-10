# Maintainer: jojii <jojii@gmx.net>
pkgname=earbuds
_gitname=LiveBudsCli
pkgver=0.1.8
pkgrel=1
pkgdesc="Control your galaxy buds live via cli"
url="https://github.com/JojiiOfficial/LiveBudsCli"
license=("GPL3")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("cargo" "git" "bluez" "bluez-libs" "gcc-libs" "glibc")

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ./target/release/${pkgname} --generate=zsh > _${pkgname}
    install -Dm 644 _earbuds "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    ./target/release/${pkgname} --generate=bash > ${pkgname}.fish
    install -Dm 644 ${pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}

