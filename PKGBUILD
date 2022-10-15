# Maintainer: NotAShelf  <me@notashelf.dev>
pkgname=cloneit-git
pkgver=0.1.0+30.g02a4942
pkgrel=1
pkgdesc="A cli tool to download specific GitHub directories or files."
arch=('x86_64' 'aarch64')
url="https://github.com/alok8bb/cloneit"
license=('MIT')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags | sed 's/-/+/; s/-/./'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release 
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "target/release/cloneit" "$pkgdir/usr/bin/cloneit"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

