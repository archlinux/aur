
pkgname=nijiexpose-bin
pkgver=v1.0.0beta3.dlast
_githubrel=dlang-last
# pkgver=v1.0.0beta4
# _githubrel=v1.0.0-beta4
pkgrel=1
pkgdesc="Application that allows streaming with nijilive puppets (VTuber, fork of Inochi2D which is like Live2D)"
arch=('x86_64')
url='https://github.com/nijigenerate/nijiexpose'
license=('BSD-2-Clause')
provides=('nijiexpose')
makedepends=(unzip)
depends=(freetype2 sdl2-compat libpng bzip2 zlib zstd brotli dbus openssl-3 gcc-libs systemd-libs) # sdl3 libxcb libxau libxdmcp libxext libx11 libxtst noto-fonts-cjk ttf-material-symbols-variable
_appimage="nijiexpose-$pkgver-Linux-x86_64.AppImage"
source=(
        "nijiexpose-linux-x86_64-$pkgver.zip::https://github.com/nijigenerate/nijiexpose/releases/download/$_githubrel/nijiexpose-linux-x86_64.zip"
	# "$_appimage::https://github.com/nijigenerate/nijiexpose/releases/download/$_githubrel/nijiexpose-$_githubrel-Linux-x86_64.AppImage"
	"nijiexpose.desktop"
)

sha256sums=('29b92e0bc3452ed2e5fdfbcbb8a7187d5326c934255c164dcdbe060520456277' # 94e4071dff42220467c1d187d898e6265de5ca5ec6fafbe6b2d6216e35cad757
            'b30a05243e75d4b3c7abec704fcf3aa399f6a335f137f9c13117f066868237f4')

#build() {
#    ./"$_appimage" --appimage-extract
#    chmod -R a-x+rX squashfs-root
#    chmod +x squashfs-root/usr/bin/nijiexpose
#}

package() {

    install -Dm644 "nijiexpose.desktop" "$pkgdir/usr/share/applications/nijiexpose.desktop"

    mkdir -p "$pkgdir/usr/"{bin,share}
    mkdir -p "$pkgdir/opt/nijiexpose/"

    unzip "nijiexpose-linux-x86_64-$pkgver.zip" -d "$pkgdir/opt/nijiexpose/"

    # cp -a "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/nijiexpose/"

    # mv "${pkgdir}/opt/nijiexpose/share/icons" "${pkgdir}/usr/share/"
    # mv "${pkgdir}/opt/nijiexpose/share/metainfo" "${pkgdir}/usr/share/"

    # find "${pkgdir}/opt/nijiexpose/lib/" -type l -delete
    # find "${pkgdir}/opt/nijiexpose/lib/" ! -name 'libnijiexpose_embedded_tracker.so' -type f -exec rm -f {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/nijiexpose/nijiexpose "$pkgdir/usr/bin/nijiexpose"
    # ln -s /opt/nijiexpose/bin/nijiexpose "$pkgdir/usr/bin/nijiexpose"

    # ln -sf /usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc "${pkgdir}/opt/nijiexpose/share/nijiexpose/fonts/NotoSansCJK-Regular.ttc"
    # ln -sf "/usr/share/fonts/TTF/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].ttf" "${pkgdir}/opt/nijiexpose/share/nijiexpose/fonts/MaterialIcons.ttf"

    # rm -rf "${pkgdir}/opt/nijiexpose/share/"{doc,applications}
}

