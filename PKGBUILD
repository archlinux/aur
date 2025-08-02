pkgname=nerdfonts-installer-bin
pkgver=2025.08.02.1
pkgrel=1
pkgdesc="Executable binary to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig')
makedepends=('shc')
source=("nerdfonts_installer.sh")
sha256sums=('SKIP')

build() {
    cd "$srcdir"
    
    # The script should already be here, just make sure it's executable
    chmod +x nerdfonts_installer.sh
    
    # Compile the script into a binary using shc
    shc -f nerdfonts_installer.sh -o nerdfonts-installer
    
    # Verify the binary was created
    if [ ! -f "nerdfonts-installer" ]; then
        echo "Error: Failed to create nerdfonts-installer binary"
        return 1
    fi
    
    echo "Successfully compiled nerdfonts-installer binary"
}

package() {
    cd "$srcdir"
    
    # Install the generated binary to the appropriate directory
    install -Dm755 "nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
}
