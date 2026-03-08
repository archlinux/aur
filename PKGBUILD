# Maintainer: Sosukeaizen <age3dude@gmail.com>
pkgname=front-porch-ai-beta-bin
pkgver=0.9.0_Beta
pkgrel=1
pkgdesc="A chilled out frontend for KoboldCPP (beta/pre-release)"
arch=('x86_64')
url="https://github.com/linux4life1/front-porch-AI"
license=('GPL-3.0-or-later')
depends=('gtk3' 'glib2' 'libsecret' 'fuse2')
provides=('front-porch-ai')
conflicts=('front-porch-ai' 'front-porch-ai-bin')
options=('!strip' '!debug')
_tag="0.9.0-Beta"
source=("Front_Porch_AI-Linux.AppImage::https://github.com/linux4life1/front-porch-AI/releases/download/${_tag}/Front_Porch_AI-Linux.AppImage"
        "front-porch-ai.desktop"
        "front-porch-ai.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
noextract=('Front_Porch_AI-Linux.AppImage')

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/Front_Porch_AI-Linux.AppImage" "${pkgdir}/opt/front-porch-ai/front-porch-ai.AppImage"

    # Create launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/front-porch-ai" <<'EOF'
#!/bin/sh
exec /opt/front-porch-ai/front-porch-ai.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/front-porch-ai"

    # Desktop entry
    install -Dm644 "${srcdir}/front-porch-ai.desktop" "${pkgdir}/usr/share/applications/front-porch-ai.desktop"

    # Icon
    install -Dm644 "${srcdir}/front-porch-ai.png" "${pkgdir}/usr/share/pixmaps/front-porch-ai.png"
}
