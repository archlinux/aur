# Maintainer: linux4life <age3dude@gmail.com>
pkgname=front-porch-ai-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="A chilled out frontend for KoboldCPP"
arch=('x86_64')
url="https://github.com/linux4life1/front-porch-AI"
license=('GPL-3.0-or-later')
depends=('gtk3' 'glib2' 'libsecret')
provides=('front-porch-ai')
conflicts=('front-porch-ai')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linux4life1/front-porch-AI/releases/download/v${pkgver}/Front_Porch_AI_Linux.tar.gz"
        "front-porch-ai.desktop"
        "front-porch-ai.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
noextract=()

package() {
    # Install to /opt
    install -d "${pkgdir}/opt/front-porch-ai"
    cp -r "${srcdir}/"* "${pkgdir}/opt/front-porch-ai/"
    # Remove non-app files that got copied
    rm -f "${pkgdir}/opt/front-porch-ai/front-porch-ai.desktop"
    rm -f "${pkgdir}/opt/front-porch-ai/front-porch-ai.png"
    rm -f "${pkgdir}/opt/front-porch-ai/${pkgname}-${pkgver}.tar.gz"

    # Symlink to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/front-porch-ai/front_porch_ai "${pkgdir}/usr/bin/front-porch-ai"

    # Desktop entry
    install -Dm644 "${srcdir}/front-porch-ai.desktop" "${pkgdir}/usr/share/applications/front-porch-ai.desktop"

    # Icon
    install -Dm644 "${srcdir}/front-porch-ai.png" "${pkgdir}/usr/share/pixmaps/front-porch-ai.png"
}
