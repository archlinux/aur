# Maintainer: Arsany Samuel <arsanysamuel.as@gmail.com>
pkgname=stakpak-bin
pkgver=0.2.62
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
sha256sums_x86_64=('7f6d936dae7da64b45acdadef654863f2d47866660c6cf821430707bbf63c4cd'
                   'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                   '8320695d303094310734f5df7e96722a03d7948b076d52849a7b014006aff793')
sha256sums_aarch64=('3bc82df11d552c8134436fd0d752cda0f551932d9e80f038110f0c3ec0e39232'
                    'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                    '8320695d303094310734f5df7e96722a03d7948b076d52849a7b014006aff793')

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
