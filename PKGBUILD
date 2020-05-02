# Maintainer: Hanna Reitz <hanna at xanclic dot moe>
pkgname=leddy-git
pkgver=r30.2945cb1
pkgrel=1
pkgdesc="Linux LED controller for the fnatic miniSTREAK keyboard"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/XanClic/leddy"
license=('GPL3')
depends=('libusb')
makedepends=('rust'
             'cargo'
             'git'
             'pkgconf')
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
