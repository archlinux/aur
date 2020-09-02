# Maintainer: shimunn <shimun@shimun.net>
pkgname=fido2luks
pkgver=0.2.12
pkgrel=1
makedepends=('rust' 'cargo' 'cryptsetup' 'clang')
depends=('cryptsetup')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Decrypt your LUKS partition using a FIDO2 compatible authenticator"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimunn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("3c4baa642d0fb705a2a4c52de4d4483531e920a483904d59ba517d9bbb8dcf17")
url="https://github.com/shimunn/fido2luks"
license=('MPL-2.0')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
