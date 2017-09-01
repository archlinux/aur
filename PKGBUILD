# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>

pkgname=cargo-apk-git
_pkgname=cargo-apk
pkgver=r309.4dd5cc9
pkgrel=1
pkgdesc="Cargo subcommand that allows you to build Android packages."
arch=('i686' 'x86_64')
license=('Apache')
depends=('cargo')
makedepends=('rust' 'cmake' 'git')
conflicts=('cargo-apk')
provides=('cargo-apk')
source=("$pkgname::git+https://github.com/tomaka/android-rs-glue.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname/cargo-apk
    cargo build --release
}

package() {
    cd $pkgname

    install -dm 755 "${pkgdir}"/usr/bin
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm755 cargo-apk/target/release/cargo-apk "${pkgdir}"/usr/bin/cargo-apk
}
