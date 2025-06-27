# Maintainer: Robert Baker <reiichi001@gmail.com>
pkgname=xivlauncher-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online - github binary artifact wrapper"
arch=('x86_64')
url='https://github.com/goatcorp/XIVLauncher.Core'
license=('GPL')
depends=(
    'aria2'
    'sdl2' 
    'libsecret'
    'desktop-file-utils'
    'jxrlib'
)
optdepends=('steam')
options=('!strip' '!debug')
provides=("xivlauncher=${pkgver}")
conflicts=(
	"xivlauncher"
        "xivlauncher-git"
)
source=(
    "XIVLauncher.Core-$pkgver.$pkgrel.tar.gz::https://github.com/goatcorp/XIVLauncher.Core/releases/download/${pkgver}/XIVLauncher.Core.tar.gz"
    "512.png::https://raw.githubusercontent.com/goatcorp/XIVLauncher.Core/main/misc/linux_distrib/512.png"
    "XIVLauncher.desktop"
    "xivlauncher-core"
)
sha512sums=(
    '8e5bf0bdddb9d8c80d7ddc4e1b7c318255f62056919c1043649d48fe9e769e10ea9cb5a450def8c31816d03ac7813bbf7a3be47ea9dc65fe533ff2d1d121b5aa'
    '0c33502cd915132151fa4b6c94899bf3f8806c2943469609cdda09365ff78be863215abd2741048d6c9a934a22dca0f8a8a2c67074c38abc6f67984c393859c4'
    'c06130b67efff8aa53760cb9c8bd764d4307624ec42c52d58cce388863e64788821f6f836857f200452e75de3b5311466074c70b81ad6d70ab60b286ddfda2e8'
    '1b4584216828fac294d9955924a89bba716bcb6f1ec582e50f3169e1501eb3d637cb89f921d887d8aba20eb4a4166915e9812aad634bcfd10ab97324164aaec5'
)

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
    install -D -m755  "${srcdir}/xivlauncher-core" "${pkgdir}/usr/bin/xivlauncher-core"
}
