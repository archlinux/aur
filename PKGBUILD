# Maintainer: Stefanistkuhl <stefanistkuhl@example.com>
pkgname=gns3util
pkgver=1.0.2
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=('2ab3ba906d83e7bd66e59dad26065b7d28e6324bcfa7d630ca67c014f7bde8c5')
sha256sums_aarch64=('7ea74a4c7e7c7217c258ba2c0af99f2490ed6e4e9bc4230088b7da0c153ee46a')

package() {
    # Install binary (rename from platform-specific name to generic name)
    if [ -f "gns3util-linux-amd64" ]; then
        install -Dm755 gns3util-linux-amd64 "${pkgdir}/usr/bin/gns3util"
    elif [ -f "gns3util-linux-arm64" ]; then
        install -Dm755 gns3util-linux-arm64 "${pkgdir}/usr/bin/gns3util"
    fi
    
    # Install shell completions
    if [ -d "completions" ]; then
        # Bash completion
        if [ -f "completions/gns3util.bash" ]; then
            install -Dm644 completions/gns3util.bash "${pkgdir}/usr/share/bash-completion/completions/gns3util"
        fi
        
        # Zsh completion
        if [ -f "completions/_gns3util" ]; then
            install -Dm644 completions/_gns3util "${pkgdir}/usr/share/zsh/site-functions/_gns3util"
        fi
        
        # Fish completion
        if [ -f "completions/gns3util.fish" ]; then
            install -Dm644 completions/gns3util.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gns3util.fish"
        fi
    fi
    
    # Install man page if it exists
    if [ -f "man/gns3util.1" ]; then
        install -Dm644 man/gns3util.1 -t "${pkgdir}/usr/share/man/man1"
    fi
    
    # Install license
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
