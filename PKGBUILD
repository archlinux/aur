# Maintainer: stickpro <stickpro@stickpro.dev>
pkgname=kyp
pkgver=0.2.3
pkgrel=1
pkgdesc="Local-first terminal password manager with TOTP support"
arch=('x86_64' 'aarch64')
url="https://github.com/stickpro/kyp"
license=('MIT')
keywords=('password-manager' 'passwords' 'totp' '2fa' 'cli' 'tui' 'security' 'encryption' 'sqlite')
provides=('kyp')
conflicts=('kyp-bin' 'kyp-git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stickpro/kyp/archive/v${pkgver}.tar.gz")
sha256sums=('384f6d8c673cde6078894dc6f192c08f13efd41aed2a128e0c3162b5a95c5430')

build() {
    cd "kyp-${pkgver}"
    go build \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o kyp \
        ./cmd/kyp
}

package() {
    cd "kyp-${pkgver}"
    install -Dm755 kyp "${pkgdir}/usr/bin/kyp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
