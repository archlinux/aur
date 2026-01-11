# Maintainer: spaciousejar <jadhavvicky752@gmail.com>
pkgname=packettracer-bin
pkgver=9.0
pkgrel=1
pkgdesc="Cisco Packet Tracer is a powerful network simulation program"
arch=('x86_64')
url="https://www.netacad.com/courses/packet-tracer"
license=('EULA ')
depends=('coreutils' 'fuse2' 'zstd' 'pcre2' 'sudo' 'xdg-utils' 'gtk-update-icon-cache' 'glibc' 'gcc-libs' 'bash')
options=('!strip' '!emptydirs')
install=packettracer-bin.install
source=("https://github.com/spaciousejar/packettracer-bin/releases/download/9.0/CiscoPacketTracer_900_Ubuntu_64bit.deb")
sha256sums=('dd9ac0d4c7fc37dcb68f627fd7c7e6fa6d4200c14492526e5618b9bd172ed920')

package() {
    # Extract the deb file
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    
    # Create symlink in /usr/local/bin
    mkdir -p "${pkgdir}/usr/local/bin"
    ln -sf "/opt/pt/packettracer.AppImage" "${pkgdir}/usr/local/bin/packettracer.AppImage"
    ln -sf "/opt/pt/packettracer.AppImage" "${pkgdir}/usr/local/bin/packettracer-bin"
    
    # Create desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/packettracer.desktop" << EOF
[Desktop Entry]
Name=Cisco Packet Tracer
Comment=Network simulation tool
Exec=/usr/local/bin/packettracer-bin
Icon=packettracer
Terminal=false
Type=Application
Categories=Education;Network;
EOF
    
    # Install license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "Cisco Packet Tracer is proprietary software. Please refer to the EULA during installation." > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # # Installation instructions
    # echo "# The package was built successfully! You need to install it as root. Run:"
    # echo "# sudo pacman -U packettracer-bin-9.0-1-x86_64.pkg.tar.zst"
}