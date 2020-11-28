# Maintainer: zhaozhen <zhaozhen@uniontech.com>
# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=com.yyets
pkgver=3.2.9.1
pkgrel=1
pkgdesc="人人影视，分享让世界更精彩
 人人影视Linux客户端支持在线观看、离线缓存、P2P加密传输、全面覆盖平台、自动下载追剧、更安全更极速。全程加密的P2P传输，让热门资源下载更快。支持UOS 20、Deepin 20操作系统。"
arch=("x86_64")
url="http://yyets.com/"
license=("custom")
depends=('aria2' 'x264' 'x265' 'libwebp' 'libvpx' 'libva' 'portaudio' 'qt5-webchannel' 'qt5-multimedia' 'tesseract' 'opencv' 'qt5-serialport' 'libebur128' 'libssh')
source=("RRshare_uos_amd64.deb::https://od.zhullyb.workers.dev/?file=/linux/RRshare_uos_amd64.deb")

md5sums=('41f9e97f7d3723c6b1a68b793c111686')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mkdir -p "${pkgdir}"/usr/share/applications/
    mkdir -p "${pkgdir}"/opt/rrshare
    mv ${pkgdir}/opt/apps/com.yyets/entries/*   ${pkgdir}/usr/share/
    mv ${pkgdir}/opt/apps/com.yyets/files/*   ${pkgdir}/opt/rrshare/
    rm ${pkgdir}/opt/rrshare/RRShare.sh
    rm -r ${pkgdir}/opt/apps/
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/rrshare/RRShare "${pkgdir}"/usr/bin/rrshare
    sed -i 's|Exec=/opt/apps/com.yyets/files/RRShare.sh|Exec=rrshare %U|g' $pkgdir/usr/share/applications/com.yyets.desktop 
}
  
