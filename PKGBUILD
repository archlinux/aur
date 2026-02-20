# Maintainer: Arsany Samuel <arsanysamuel.as@gmail.com>
pkgname=stakpak-bin
pkgver=0.3.56
pkgrel=1
pkgdesc="Stakpak is a terminal-native DevOps Agent in Rust 🦀. It can run commands, edit files, search docs, and more. It has security super powers, and generates high quality IaC"
arch=('x86_64' 'aarch64')
url="https://stakpak.dev"
license=('Apache')
depends=('glibc' 'openssl')

# Source URLs for different architectures
source_x86_64=(
    "stakpak-linux-x86_64.tar.gz::https://github.com/stakpak/agent/releases/download/v${pkgver}/stakpak-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/stakpak/agent/v${pkgver}/LICENSE"
    "README.md::https://raw.githubusercontent.com/stakpak/agent/v${pkgver}/README.md"
)
source_aarch64=(
    "stakpak-linux-aarch64.tar.gz::https://github.com/stakpak/agent/releases/download/v${pkgver}/stakpak-linux-aarch64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/stakpak/agent/v${pkgver}/LICENSE"
    "README.md::https://raw.githubusercontent.com/stakpak/agent/v${pkgver}/README.md"
)

# Generated checksums using updpkgsums
sha256sums_x86_64=('94f8bf47b954c8e2bfaa0fd218c7bfa5ebb16a38129726cc1c8bda96c1a6c749'
                   'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                   'e268d0488546f8c8cabd8d166565339f9bb36d3a6ad72cabc9de14d273b43f46')
sha256sums_aarch64=('e8fdf521b31394156400630d692a8146284f4d41f3a88687fd5d969cfaa23d14'
                    'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                    'e268d0488546f8c8cabd8d166565339f9bb36d3a6ad72cabc9de14d273b43f46')

package() {
    # Install the main binary
    install -Dm755 stakpak "${pkgdir}/usr/bin/stakpak"
    
    # Install license and readme (from the source repository)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install man page if available
    if [ -f "stakpak.1" ]; then
        install -Dm644 stakpak.1 "${pkgdir}/usr/share/man/man1/stakpak.1"
    fi
}
