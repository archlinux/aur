# Maintainer: three water threewaterzxm@gmail.com
# URL: https://github.com/chenmozhijin/LDDC
pkgname=lddc-bin
pkgver=0.9.2
pkgrel=1
license=(GPL3)
pkgdesc="简单易用的精准歌词(逐字歌词/卡拉OK歌词)下载匹配工具|A simple and user-friendly tool for downloading and matching precise lyrics (word-by-word lyrics/Karaoke lyrics)"
url="https://github.com/chenmozhijin/LDDC"
arch=('x86_64')
source=($url/releases/download/v${pkgver}/LDDC_${pkgver}_amd64.deb)
md5sums=('08e2af069ffeae670994961fc12b94ad')


package() {
    bsdtar -xpvf "${srcdir}/data.tar.zst"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/icons/"
    install -d "${pkgdir}/opt/lddc-bin/"

    # Program install 
    mv ${srcdir}/usr/lib/LDDC/* ${pkgdir}/opt/lddc-bin/
    chmod 755 "${pkgdir}/opt/lddc-bin/LDDC.bin"

    # Desktop and icon install
    install -Dm644 "${srcdir}/usr/share/applications/LDDC.desktop" "${pkgdir}/usr/share/applications/LDDC.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/LDDC.ico" "${pkgdir}/usr/share/cons/LDDC.ico"

    sed -i 's#/usr/bin/LDDC#/opt/lddc-bin/LDDC.bin#g' "${pkgdir}/usr/share/applications/LDDC.desktop"
    
}
