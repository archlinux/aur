# Contributor: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname="n-link"
pkgver=0.1.6
pkgrel=3
pkgdesc="Free, cross-platform, CX-II compatible computer linking program for the TI-Nspire"
url="https://lights0123.com/n-link/"
license=('GPL3')
arch=("x86_64" "armv7h" "aarch64")
depends=("webkit2gtk" "squashfs-tools")
makedepends=("yarn" "cargo")
provides=("n-link")
conflicts=("n-link-git" "n-link.bin")
source=("n-link-$pkgver.tar.gz::https://github.com/lights0123/n-link/archive/refs/tags/v$pkgver.tar.gz"
        "69-n-link.rules")
b2sums=('0ea8b945e10f79fa7f48f83fde5828ca283b122ba5decd24fd6a48dbf95058507fdf0a3255d66d33ae039710406f5ffe8bb0221de7639dcf2fb6c7343cfdbf19'
        '889b25dc837fdbf5891243b2a6c6b190eef53333d9e01276ff28cab926a6ed49d8a93e41cb4fb76456a716203bac7ffe230abb4333eba3435353bd809387b0bb')
install="n-link.install"

build(){
 cd "n-link-$pkgver/desktop"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 # install dependencies, including tauri
 yarn
 # build front-end and back-end
 # CURRENLY BROKEN
 yarn tauri:build
}

package(){
 # COPY FILES
 find "$pkgdir" -type d -exec chmod 755 {} \;
 find "$pkgdir/usr/bin/" -type f -executable -exec chmod 755 {} \;
 install -D -m 644 "69-${pkgname}.rules" "${pkgdir}/etc/udev/rules.d/69-${pkgname}.rules"
}
