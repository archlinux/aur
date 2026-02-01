# Maintainer: MadGoatHaz <your-email@example.com>
pkgbase=goatd-kernel-bin
pkgname=goatdkernel
pkgver=0.2.1
pkgrel=2
pkgdesc="GOATd Kernel - High-performance computing platform with multi-language integration"
arch=('x86_64')
url="https://github.com/MadGoatHaz/GOATd-Kernel"
license=('MIT')
depends=('gtk3' 'glib2' 'systemd-libs' 'libepoxy' 'pango' 'gdk-pixbuf2' 'atk' 'cairo' 'harfbuzz' 'fribidi' 'libthai' 'libxft' 'fontconfig' 'libxrender' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'libpng' 'zlib' 'bzip2' 'brotli' 'freetype2' 'libffi' 'pcre2' 'libblkid' 'libmount' 'libcap' 'libgpg-error' 'libgcrypt' 'lz4' 'xz' 'zstd' 'libsystemd' 'libdrm' 'wayland' 'mesa' 'libglvnd' 'libxi' 'libxrandr' 'libxcursor' 'libxdamage' 'libxinerama' 'libxcomposite' 'libxfixes' 'libxxf86vm' 'vulkan-icd-loader' 'vulkan-driver')
optdepends=('wayland: Wayland display server support')

# The binary tarball should be named: goatdkernel-${pkgver}-x86_64.tar.gz
# Extract URL from: https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}/
source=("goatdkernel-${pkgver}-${pkgrel}-x86_64.tar.gz::https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}-${pkgrel}/goatdkernel-${pkgver}-${pkgrel}-x86_64.tar.gz"
        "git+https://github.com/MadGoatHaz/GOATd-Kernel.git#tag=v${pkgver}-${pkgrel}"
        "https://github.com/MadGoatHaz/GOATd-Kernel/releases/download/v${pkgver}-${pkgrel}/goatdkernel.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    cd "${srcdir}"
    
    # Create necessary directories
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    
    # Install binaries
    if [ -f "goatd_kernel" ]; then
        install -Dm755 "goatd_kernel" "${pkgdir}/usr/bin/goatd_kernel"
    fi
    
    if [ -f "goatd-cli" ]; then
        install -Dm755 "goatd-cli" "${pkgdir}/usr/bin/goatd-cli"
    fi
    
    if [ -f "goatd-gui" ]; then
        install -Dm755 "goatd-gui" "${pkgdir}/usr/bin/goatd-gui"
    fi
    
    # Install shared libraries
    if [ -d "lib" ]; then
        cp -r lib/* "${pkgdir}/usr/lib/"
    fi
    
    # Install additional resources
    if [ -d "resources" ]; then
        cp -r resources/* "${pkgdir}/usr/share/${pkgname}/"
    fi
    
    # Install desktop entry from source
    if [ -f "${srcdir}/GOATd-Kernel/resources/goatdkernel.desktop" ]; then
        install -Dm644 "${srcdir}/GOATd-Kernel/resources/goatdkernel.desktop" "${pkgdir}/usr/share/applications/goatdkernel.desktop"
    fi
    
    # Install icon from source
    if [ -f "goatdkernel.png" ]; then
        install -Dm644 "goatdkernel.png" "${pkgdir}/usr/share/pixmaps/goatdkernel.png"
    fi
}
