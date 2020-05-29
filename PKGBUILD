# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak-git
pkgver=0.7.0.r17.g500d73f
pkgrel=2
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/${pkgname%-git}"
license=('MIT' 'custom')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('cargo' 'git' 'rust')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --always --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    cargo fetch
}

build() {
    cd "${pkgname%-git}"
    cargo build --release --locked --all-features
}

package () {
    cd "${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/${pkgname%-git}
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
