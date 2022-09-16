# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=6.1.2
pkgrel=1
pkgdesc="A system information fetcher, with an (unhealthy) emphasis on performance."

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'libgit2' 'git')

arch=('x86_64')
license=('MIT')

url="https://github.com/Macchina-CLI/macchina"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6935ada948bf6f63121ef91866304047a5781d19e7ea43c18c290515a76e6a8')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "doc/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm 644 "doc/${pkgname}.7" -t "${pkgdir}/usr/share/man/man7"

    install -d "${pkgdir}/usr/share/${pkgname}/themes"
    install -m 644 contrib/themes/* "${pkgdir}/usr/share/${pkgname}/themes"
}
