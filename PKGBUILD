# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=youku
pkgver=1.0.0
pkgrel=3
pkgdesc="YouKu Video client"
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
arch=('x86_64')
license=('GPL')
makedepends=('electron9')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
source=('https://mirrors.163.com/ubuntukylin/pool/partner/youku-app_1.0.0_amd64.deb'
        'youku.desktop'
)
sha256sums=('c28ade22d41fa6074fce7f2cb06f9db4dfba439698bbea37b0f5735d9ae30075'
            '6b984c5b95804defaaa8bba57563e7dbe0a6a841712240822a1764670cd805c2')
build() {
    tar xf data.tar.xz
    mv opt/优酷/ opt/youku
    cp -rf /usr/lib/electron9/* opt/youku/
    mv opt/youku/{electron,YouKu}
}

package() {
    install -d ${pkgdir}/usr/lib/
    cp -rf opt/youku ${pkgdir}/usr/lib/

    install -d ${pkgdir}/usr/share/
    find usr/share/icons/hicolor/ -type f -exec rename YouKu youku {} \;
    cp -rf usr/share/icons ${pkgdir}/usr/share

    install -d ${pkgdir}/usr/bin
    ln -sf /usr/lib/youku/YouKu ${pkgdir}/usr/bin/youku

    install -Dm644 opt/youku/resources/assets/images/app_icon256.png ${pkgdir}/usr/share/pixmaps/youku.png
    install -Dm644 ${srcdir}/youku.desktop ${pkgdir}/usr/share/applications/youku.desktop
}
