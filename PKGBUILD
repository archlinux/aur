# Maintainer: shimunn <shimun@shimun.net>
pkgname=fido2luks
pkgver=0.2.16
pkgrel=1
makedepends=('rust' 'cargo' 'cryptsetup' 'clang')
depends=('cryptsetup')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Decrypt your LUKS partition using a FIDO2 compatible authenticator"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimunn/${pkgname}/archive/${pkgver}.tar.gz")
# curl -L https://github.com/shimunn/fido2luks/archive/0.2.16.tar.gz | sha256sum
sha256sums=("353e77753bc496fd9ac6e12c8715e49d81cd66eec57e8f17c13723fa887cbcaf")
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
