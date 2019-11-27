# Maintainer: alpha0x00 <li_tking@163.com>
pkgname=xmind-zen
# the versin is from deb package
pkgver=9.0.6
pkgrel=3
pkgdesc="XMind ZEN - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('gconf' 'libxss' 'nss' 'libxtst' 'gtk2' 'alsa-lib')

source=('https://dl2.xmind.cn/XMind-ZEN-for-Linux-64bit.deb'
        'license-cn.pdf::https://support.xmind.net/attachments/token/qvKUIYsn68qGSTkilil2Ip6S7/?name=%E7%94%A8%E6%88%B7%E8%AE%B8%E5%8F%AF%E5%8D%8F%E8%AE%AE+-+cn.pdf'
        'xmind.xml'
        'lib.tar.xz'
       )
# library from pango-1.43, fix break beacause of old version harfbuzz used by pango

sha256sums=('abfc352bab17859c7b4d061f233db2a2b252d062cc24c6332eb1d86a5bf56069'
            '051794a69573487c7704e08fa996f8ed61fd0d3adc7b3b7a09985ab5773460d8'
            '833f6f1a7ddd73ea2487a21390e16b57c3fa817a560f385a034efdd1ed754a8d'
            '7e7e3a036afa39ded1735d8e412974c9b991c2f19b70d22641cd49e1b2352fe7')

package() {
    tar xf data.tar.xz -C ${pkgdir}/

    # install libraries from pango-1.43
    tar xf lib.tar.xz -C "${pkgdir}/opt/XMind ZEN/"

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind ZEN/XMind" ${pkgdir}/usr/bin/xmind-zen

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-zen
    cp license-cn.pdf ${pkgdir}/usr/share/licenses/xmind-zen/
}
