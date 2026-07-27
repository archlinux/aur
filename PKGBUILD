# Maintainer: Hayden Parker <hayden@bounce.chat>
pkgname=bounce-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A metadata-protecting distributed group chat application"
arch=('x86_64')
url="https://github.com/bounce-chat/bounce"
license=('MIT')
provides=("${pkgname}")
conflicts=('bounce' 'bounce-bin')
makedepends=('binutils')
depends=('hicolor-icon-theme' 'libglvnd' 'wayland')
options+=( !debug )
source=(
	"https://github.com/bounce-chat/bounce/releases/download/v${pkgver}/bounce-${pkgver}.deb"
	"LICENSE"
)
sha256sums=('87b3762afd8a216fc5183947a65def0e81090351a841e71f8ac023ee78494a64'
            'e52465d21d1b91e02357470ae262725b8f73d7ecc271a8d1ed7ff2e49f3bc6dc')

package() {
    ar x "${srcdir}/bounce-${pkgver}.deb"
    tar xf "${srcdir}/data.tar.xz"

    install -Dm755 "${srcdir}/usr/local/bin/bounce" "${pkgdir}/usr/bin/bounce"
    install -Dm644 "${srcdir}/usr/share/applications/bounce.desktop" "${pkgdir}/usr/share/applications/bounce.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/bounce.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bounce.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
