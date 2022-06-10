# Maintainer: sukanka <su975853527 at gmail dot com>


pkgname=baidu-translate-client-bin
_pkgname=baidu-translate-client
pkgver=1.5.3
pkgrel=1
pkgdesc="baidu translate "
arch=('x86_64')
url="https://fanyi.baidu.com/"
license=('unknown')
depends=('electron11')
optdepends=()
provides=(${_pkgname} "baidu-translate")
source=(
  "${_pkgname}-${pkgver}.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.baidu.translateclient/com.baidu.translateclient_${pkgver}_amd64.deb"
  "$_pkgname.sh"
)
sha512sums=('2943df6829acf43aba537da0cea31d41f94bb7ceb3df88ddbec32199cb102e6f58209e4ee66d5dc2d29719bace94c05536e284c993f49a64ecd3cdf4613b5441'
            'fab6f76c73e0dd5e126adc1e74d4cd372cf917f4e0fb708ecfae59d12d5a42080cbae0ed66e9239f94ac87a1e00c41db9ad8562f49f2e579536b917f29efcb22')


prepare(){
  tar -xvf data.tar.xz -C ${srcdir}
}
package(){
    cd $srcdir/opt/apps/com.baidu.translateclient/
    install -Dm755 ${srcdir}/${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    
    rmdir entries/autostart
    sed -i "s|^Exec.*|Exec=${_pkgname}|g" entries/applications/com.baidu.translateclient.desktop
    cp -rf entries ${pkgdir}/usr/share
    
    install -Dm644 files/resources/app.asar -t ${pkgdir}/usr/lib/${_pkgname}
    
}
# vim: ts=2 sw=2 et:
