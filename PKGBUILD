# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-bin
pkgver=2.1.0
pkgrel=2
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
provides=('kwin-bismuth')
conflicts=('kwin-bismuth')
options=('!emptydirs')

source=(
    "bismuth-bin-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/binary-release.tar.gz"
    'hide-tray-icon.patch'
)

sha512sums=(
    '3cb3eab9a3109331e3f1b0ea94466e9250b26964c7136bb94470b55254a70e343961536830cb18522c558d3ba28513f3d52d1a697ce9e0faa6789b99ed027ed6'
    'aab3cecfcb8dcfcb1a367a264fb2e95c446ceb9d2588eec51a98455936dde4fe62daa483952a437c7cb903105a3371ebb137d6e1c512ea9dc11b9c7baced101c'
)

package() {
    cd "${srcdir}"

    install -Dm644 -t "${pkgdir}/usr/lib/qt/plugins/kcms" "lib/x86_64-linux-gnu/plugins/kcms/kcm_bismuth.so"

    rm "share/icons/hicolor/icon-theme.cache"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        patch -p0 -N -i "hide-tray-icon.patch"
    fi

    cp -rt "${pkgdir}/usr" "share"
}
