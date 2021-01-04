# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-ingest-git
pkgver=r164.af28eff
pkgrel=1
pkgdesc="A FTL handshake server written in Rust"
arch=(x86_64)
url="https://github.com/GRVYDEV/Lightspeed-ingest"
license=("custom:MIT")
depends=("gcc-libs")
optdepends=("lightspeed-webrtc: Translate Stream to WebRTC")
makedepends=("rust" "git" "gcc")
provides=("lightspeed-ingest")
conflicts=("lightspeed-ingest")
source=("${pkgname}::git+https://github.com/GRVYDEV/Lightspeed-ingest.git"
        "systemd.service")
sha512sums=('SKIP'
            'd0b32093ea65ab018aab9d4952355a6684de38285e3bb7e380d25f2266128efee09959685b2c7496237741cb52c6147c03a091843afbc41f7b485e247cb70f35')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    cargo build --release --locked
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/lightspeed-ingest" "${pkgdir}/usr/bin/lightspeed-ingest"

    install -Dm755 "../systemd.service" "${pkgdir}/usr/lib/systemd/system/lightspeed-ingest.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/lightspeed-ingest/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
