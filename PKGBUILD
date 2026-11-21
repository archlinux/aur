# Maintainer: Anysets <anysets@qq.com>
pkgname=spark-store
pkgver=5.3.4
pkgrel=1
pkgdesc="A community powered app store."
arch=('x86_64' 'aarch64')
url="https://www.spark-app.store/"
license=('GPL3')

depends=(
    'nss'
    'libxss'
    'libxtst'
    'at-spi2-core'
    'desktop-file-utils'
    'libsecret'
    'xdg-utils'
    'lsb-release'
    'shared-mime-info'
    'libnotify'
    'util-linux'
    'polkit'
    'aria2'
    'zenity'
    'amber-package-manager>=1.2.2'
    'flatpak'
    'qt5-base'
    'gtk3'
)
install=spark-store.install
options=(!strip !debug)
# source_x86_64=("https://gitee.com/spark-store-project/spark-store/releases/download/${pkgver}/spark-store_${pkgver}_amd64.deb")
source_x86_64=("https://www.gitlink.org.cn/shenmo7192/spark-store/releases/download/${pkgver}/spark-store_${pkgver}_amd64.deb")

# source_aarch64=("https://gitee.com/spark-store-project/spark-store/releases/download/${pkgver}/spark-store_${pkgver}_arm64.deb")
source_aarch64=("https://www.gitlink.org.cn/shenmo7192/spark-store/releases/download/${pkgver}/spark-store_${pkgver}_arm64.deb")

sha256sums_x86_64=('fad5b38da9061ff564f226501040c1041a57aa2f9cef9d62ed7f15f244898ea7')
sha256sums_aarch64=('1745063e93578f48bf9e0c1fb44d2165559b90ed8191fdbc0767877de2c0953f')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    rm -rf "${pkgdir}/lib"
    rm -rf "${pkgdir}/tmp"
    # sed -i '2i\exit 0' "${pkgdir}/opt/durapps/spark-store/bin/aptss" || true

    # spark-store postinst
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/polkit-1/actions"
    # ln -sf $pkgdir/opt/durapps/spark-store/bin/ssinstall "$pkgdir/usr/bin/ssinstall"
    # ln -sf $pkgdir/opt/durapps/spark-store/bin/ssaudit "$pkgdir/usr/bin/ssaudit"
    ln -sf /opt/durapps/spark-store/bin/spark-dstore-patch "$pkgdir/usr/bin/spark-dstore-patch"
    ln -sf /opt/durapps/spark-store/bin/spark-store "$pkgdir/usr/bin/spark-store"
    # ln -sf /opt/durapps/spark-store/bin/aptss "$pkgdir/usr/bin/aptss"


    # polkit policy
    install -Dm644 \
        "$pkgdir/opt/spark-store/extras/store.spark-app.spark-store.policy" \
        "$pkgdir/usr/share/polkit-1/actions/store.spark-app.spark-store.policy"
}
