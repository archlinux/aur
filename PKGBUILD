# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=browser360
pkgver=10.0.2001.0
pkgrel=1
pkgdesc="360 Security Browser"
arch=('x86_64')
url="https://browser.360.cn/se/linux/"
license=('custom')
depends=(
    'ca-certificates'
    'ttf-liberation'
    'gconf'
    'libappindicator-gtk3'
    'gconf'
    'gtk2'
    'nss'
    'libxss'
    'lsb-release'
    'wget'
    'xdg-utils'
)
source=(
    'https://down.360safe.com/gc/browser360-cn-stable_10.0.2001.0-1_amd64.deb'
)
md5sums=(
    'f441827dc69590b0af35267fe33ad8d7'
)

package() {
    tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
    # remove cron
    rm -rf "${pkgdir}"/etc/
    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/browser360/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/$i/apps/${pkgname}.png
    done
    rm "${pkgdir}"/opt/browser360/product_logo_*
}
