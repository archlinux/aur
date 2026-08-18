# Maintainer: Anysets <anysets@qq.com>
pkgname=spark-store
pkgver=5.3.0.2
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

sha256sums_x86_64=('36c7ad9e29723efa3dc030876a6f0f62ff2b39c3d152235a555ea675b4e8499b')
sha256sums_aarch64=('43ae9a26c3f2a2f66ebfd1c20d6227c1469cf2a9161dec8f906a10d707d30fd4')
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
