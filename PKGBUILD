# Maintainer: ernest <307141632@qq.com>
pkgname=rwork
pkgdesc="润工作整合即时沟通、云文档、音视频会议、工作台等功能于一体，助力个人与企业开启未来办公新模式！" 
pkgver=7.32.0
pkgrel=1
arch=('x86_64')
url="https://rwork.crc.com.cn/gxlog/index.html"
license=('LicenseRef-rwork')
source=("https://rwork.crc.com.cn/download/Rwork3.0-linux_x64-${pkgver}.deb")
md5sums=('3ea588611a117c2b6d1ebd4b1d27d266')
options=('!strip' '!debug')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
prepare() {
    mv "Rwork3.0-linux_x64-${pkgver}.deb" "${pkgver}.deb"
    ar -x "${pkgver}.deb"
    mkdir -p "${pkgname}-${pkgver}"

    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
    cd "$pkgname-$pkgver"
    cp -r ./ ${pkgdir}/
    
    # 安装图标到hicolor主题
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    if [ -f "${pkgdir}/opt/crc/rwork/product_logo_256.svg" ]; then
        cp "${pkgdir}/opt/crc/rwork/product_logo_256.svg" \
           "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rwork.svg"
    fi
    
    # 修改desktop文件
    find "${pkgdir}" -name "*.desktop" -type f -exec \
        sed -i 's/Icon=.*/Icon=rwork/' {} \;
}
