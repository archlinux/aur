# Maintainer: Hanna Reitz <hanna at xanclic dot moe>
pkgname=leddy-git
pkgver=r1.802fead
pkgrel=1
pkgdesc="Linux LED controller for the fnatic miniSTREAK keyboard"
arch=('any')
url="https://github.com/XanClic/leddy"
license=('GPL3')
depends=('libusb')
makedepends=('rust'
             'cargo'
             'git')
provides=('leddy')
conflicts=('leddy')
source=("$pkgname::git://github.com/XanClic/leddy.git")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --locked --all-features
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm 755 "target/release/leddy" -t "${pkgdir}/usr/bin"
}
