# Maintainer: theguy147
pkgname=mhost-git
pkgver=0.0.7.r289.g383d691
pkgrel=1
pkgdesc='A very fast and easy to use DNS lookup utility. (git version)'
arch=('x86_64')
url="https://github.com/lukasprustina/mhost"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/lukaspustina/mhost.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/mhost
    install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm 644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
