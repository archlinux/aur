# Maintainer: shimunn <shimun@shimun.net>
pkgname=fido2luks
pkgver=0.2.13
pkgrel=1
makedepends=('rust' 'cargo' 'cryptsetup' 'clang')
depends=('cryptsetup')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Decrypt your LUKS partition using a FIDO2 compatible authenticator"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimunn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("07ead0bdb99f22b0d75ff3375be954c7e034fc18322d87cece2ac0468498e34d")
url="https://github.com/shimunn/fido2luks"
license=('MPL-2.0')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
    ./target/release/fido2luks completions bash target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 target/fido2luks.bash "${pkgdir}/usr/share/bash-completion/completions/fido2luks"
}
