# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink-git
pkgver=0.7.1.r0.2bcd77f
pkgrel=1
pkgdesc="Clean URLs copied to clipboard"
arch=("x86_64" "x86_64_v3")
url="https://github.com/Lurk/clink"
license=("MIT")
makedepends=(
  cargo
  libxcb
  libxkbcommon
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    cargo build --release
}

package() {
    cd "${pkgname%-git}"
    install -Dm 755 "target/release/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm 644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/readme.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

