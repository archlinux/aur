# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=netease-cloud-music-appimage
_pkgname=NetEase_Cloud_Music-1.2.0.2-1.glibc2.17-x86_64.AppImage
pkgver=1.2.0.2_1
_pkgver=1.2.0.2-1
pkgrel=1
pkgdesc="netease-cloud-music Appimage"
arch=("x86_64")
url="https://github.com/ZetaoYang/netease-cloud-music-appimage"
license=(custom)
noextract=(${_pkgname})
options=("!strip")
provides=('netease-cloud-music')
conflicts=('netease-cloud-music')
source=("$url/releases/download/${_pkgver}/${_pkgname}"
        'netease-cloud-music.sh')
sha256sums=('5ce37a71869b9aaae6ac4286a57fff9b0af72c3acfb729b9cf573789a06d6b7c'
            '5899a5c608baaaaf62f8d56a28ed374c515e0dbd64d109ee301db3311fffd120')

prepare() {
    cd "${srcdir}"
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s,Exec=netease-cloud-music %U,Exec=/usr/bin/netease-cloud-music %U,g" "squashfs-root/netease-cloud-music.desktop"
}

package() {
    cd ${srcdir}
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/opt/netease/netease-cloud-music/netease-cloud-music.AppImage"
    install -Dm755 "${srcdir}/netease-cloud-music.sh" "${pkgdir}/usr/bin/netease-cloud-music"
    install -Dm644 "${srcdir}/squashfs-root/netease-cloud-music.desktop" "${pkgdir}/usr/share/applications/netease-cloud-music.desktop"
    install -Dm644 "${srcdir}/squashfs-root/netease-cloud-music.svg" "${pkgdir}/usr/share/icons/netease-cloud-music.svg"
} 
