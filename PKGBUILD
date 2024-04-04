# Maintainer: Robert Baker <reiichi001@gmail.com>
pkgname=xivlauncher-bin
pkgver=1.0.8
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
    "XIVLauncher.Core.tar.gz::https://github.com/goatcorp/XIVLauncher.Core/releases/download/${pkgver}/XIVLauncher.Core-arch.tar.gz"
    "512.png::https://raw.githubusercontent.com/goatcorp/XIVLauncher.Core/main/misc/linux_distrib/512.png"
    "XIVLauncher.desktop"
    "openssl_fix.cnf"
    "xivlauncher-core"
)
sha512sums=(
    'f1bec7c2b22107dbedab19af9ef2f1c6edff9d4b5b2fb5512a659722cc26416b2a5adf120c90aa8817d5763a50988ef32adaa956e117c2a9e486e2f7e245c8ab'
    '0c33502cd915132151fa4b6c94899bf3f8806c2943469609cdda09365ff78be863215abd2741048d6c9a934a22dca0f8a8a2c67074c38abc6f67984c393859c4'
    'c06130b67efff8aa53760cb9c8bd764d4307624ec42c52d58cce388863e64788821f6f836857f200452e75de3b5311466074c70b81ad6d70ab60b286ddfda2e8'
    'c702d45b607a54716ae3f1c9b0aa548b3226da76b0ae4b8a88e49d16e5117a7ff5164e7dd5b6a2799a16a18d53b2de55a26a87888054c25152df5c4824b38fe0'
    'dad16da8e1d2bc772f7e1be1f59fd799c596fa88fb77a7e58a94baf10a1ca2f0ad7e79ad3baa8ba24e35dd0bc748884c74371c447816b1ea61098f58a130313a'
)

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    install -D -m644 "${srcdir}/openssl_fix.cnf" "${pkgdir}/opt/XIVLauncher/openssl_fix.cnf"
    cp -r "${srcdir}/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
    install -D -m755  "${srcdir}/xivlauncher-core" "${pkgdir}/usr/bin/xivlauncher-core"
}
