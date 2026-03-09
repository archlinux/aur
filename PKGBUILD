# Maintainer: Ciarán Coffey <github@ccoffey.ie>
pkgname='pbpctrl-plasmoid-git'
pkgver=r4.204ac76
pkgrel=1
pkgdesc='KDE Plasma 6 system tray plasmoid for controlling Google Pixel Buds Pro via pbpctrl (git)'
url='https://github.com/ciarancoffey/pbpctrl-plasmoid'
license=('MIT')
arch=('any')
depends=('plasma-workspace' 'plasma5support' 'pbpctrl' 'libpulse')
optdepends=(
    'libfdk-aac: AAC codec support'
    'liblc3: LC3/LC3-SWB codec support (best headset mode quality)'
    'libfreeaptx: aptX/aptX HD codec support'
    'libldac: LDAC codec support'
    'opus: Opus codec support (best playback quality)'
)
makedepends=('git')
provides=('pbpctrl-plasmoid')
conflicts=('pbpctrl-plasmoid')
source=('pbpctrl-plasmoid::git+https://github.com/ciarancoffey/pbpctrl-plasmoid.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd pbpctrl-plasmoid
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pbpctrl-plasmoid

    install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.ciarancoffey.pbpctrl-plasmoid"
    cp -r plasmoid/* "${pkgdir}/usr/share/plasma/plasmoids/com.github.ciarancoffey.pbpctrl-plasmoid/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
