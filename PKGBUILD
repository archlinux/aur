# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_appname=QtVsPlayer
pkgver=1.0.51_3
pkgrel=1
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('aarch64' 'x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs' 'openal' 'openssl-1.1')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver//_/-}/${_appname}_${pkgver//_/-}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver//_/-}/${_appname}_${pkgver//_/-}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('594248bf10f534ecd110018702269de7c3f182d42bdfc92952a97f95889ab3a5')
sha256sums_x86_64=('11ea38fe6da972257caa522ecb7916773b22b98613679b499a381a92ee177c2e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib64/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/usr/bin/${_appname}" -t "${pkgdir}/opt/${_appname}"
    sed "s|/usr/bin/${_appname}|/opt/${_appname}/${_appname}|g;s|Path=/usr/bin|Path=/opt/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/pixmaps"
}