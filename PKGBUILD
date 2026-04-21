# Maintainer: Simon Schubert <sschubert89@gmail.com>
# https://github.com/SimonSchubert/Braincup

pkgname=braincup-bin
pkgver=2.6.2
pkgrel=1
pkgdesc='Train your math skills, memory and focus'
arch=('x86_64')
url='https://github.com/SimonSchubert/Braincup'
license=('Apache-2.0')
depends=('hicolor-icon-theme')
provides=('braincup')
conflicts=('braincup')
options=('!strip')

source=("Braincup-${pkgver}-linux-x86_64.tar.gz::https://github.com/SimonSchubert/Braincup/releases/download/v${pkgver}/Braincup-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('d12945b6f001519b1822e459e67724dc98cd1cb4a4d0831aa0707457b3e25843')

package() {
    # Install application files
    install -dm755 "${pkgdir}/opt/braincup"
    cp -r "${srcdir}/Braincup/"* "${pkgdir}/opt/braincup/"
    chmod -R go-w "${pkgdir}/opt/braincup"

    # Install wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/braincup" << 'EOF'
#!/bin/sh
exec /opt/braincup/bin/Braincup "$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/braincup.desktop" << EOF
[Desktop Entry]
Name=Braincup
Comment=Train your math skills, memory and focus
Exec=braincup
Icon=braincup
Type=Application
Categories=Game;Education;
Keywords=Math;Memory;Focus;Brain;Training;Game;
StartupWMClass=compose-window
Terminal=false
EOF

    # Install icon
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/icons/hicolor/scalable/apps/braincup.svg" << 'EOF'
<svg viewBox="0 0 90 90" xmlns="http://www.w3.org/2000/svg">
   <circle cx="45" cy="45" r="40" fill="#6200ee" />
   <text x="45" y="60" text-anchor="middle" font-size="48" font-family="sans-serif" font-weight="bold" fill="#ffffff">B</text>
</svg>
EOF

    # Install license
    install -Dm644 "${srcdir}/Braincup/lib/Braincup.copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null ||
    install -Dm644 "${srcdir}/Braincup/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}

# Publishing steps:
# 1. Create AUR account at https://aur.archlinux.org
# 2. git clone ssh://aur@aur.archlinux.org/braincup-bin.git
# 3. Copy PKGBUILD and .SRCINFO into the cloned repo
# 4. git add PKGBUILD .SRCINFO
# 5. git commit -m "Initial upload: braincup-bin 2.5.0"
# 6. git push
