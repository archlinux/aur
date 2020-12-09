# Maintainer: jojii <jojii@gmx.net>
pkgname=rsv
pkgver=1.3.3
pkgrel=1
pkgdesc="The runit sv command rewritten in rust with nice new features"
url="https://github.com/JojiiOfficial/rsv"
license=("GPL3")
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')
arch=("x86_64")
makedepends=("cargo")
provides=("rsv")

build() {
    cd $pkgname
    cargo build --release
}

package() {
    cd $pkgname
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    ./target/release/${pkgname} --generate=zsh > _${pkgname}
    install -Dm 644 _${pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    ./target/release/${pkgname} --generate=bash > ${pkgname}.fish
    install -Dm 644 ${pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
