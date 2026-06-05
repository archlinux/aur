# Maintainer: Arsany Samuel <arsanysamuel.as@gmail.com>
pkgname=stakpak-bin
pkgver=0.3.86
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
sha256sums_x86_64=('8b8ac104800f0f65aa0b0388c22bec11dfc06a569c3687ffc00a8307347c423d'
                   'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                   '2389ea9f7d95625e1255c693af3fe479f9607e26247e30aa7c8b7a8e5aca0359')
sha256sums_aarch64=('2a14b2623b0749159e520b1f0a8c4169321b6b4db391f0555537c393ded2bea0'
                    'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                    '2389ea9f7d95625e1255c693af3fe479f9607e26247e30aa7c8b7a8e5aca0359')

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
