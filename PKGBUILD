# Maintainer: asyync1024 <asyync1024 at proton dot me>

_pkgname=elfx86exts
pkgname=${_pkgname}-git
pkgver=0.4.0.r475.g3f7c2b0
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use. (git)"
arch=('x86_64')
url="https://github.com/pkgw/${_pkgname}"
license=('MIT')
options=('!lto')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd ${_pkgname}
    cargo build --release --locked
}

check() {
    cd ${_pkgname}
    cargo test --release --locked
}

package() {
    cd ${_pkgname}
    install -Dm755 target/release/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
