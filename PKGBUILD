# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=redisinsight-deb
pkgver=2.48.0
pkgrel=3
pkgdesc="Redis Insight is a powerful desktop user interface that helps you visualize and optimize your data for Redis and Redis Stack. (Deb release)"
arch=('x86_64')
url='https://redis.com/redis-enterprise/redis-insight'
conflicts=('redisinsight')
license=('LicenseRef-SSPL')
options=('!strip')
depends=('alsa-lib'
         'at-spi2-core'
         'bash'
         'cairo'
         'dbus'
         'expat'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libcups'
         'libdrm'
         'libsecret'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'nss'
         'nspr'
         'pango'
)
source=("${pkgname}-${pkgver}.deb::https://download.redisinsight.redis.com/latest/RedisInsight-linux-amd64.deb"
        "redisinsight.sh"
        "https://github.com/RedisInsight/RedisInsight/raw/main/LICENSE")
sha256sums=('eb5cb7d606cab24a7ee82267f78a61364bfff6050ff3d39baf7acd7262ea3b31'
            '3d08bac7103a94b058567b3cc7580766a8c35229eb3c6b019d45083faebadf67'
            '34e94c5087ba6e9fb34f35ae71df5e6533c5fc7cbbf6c44186a71e82806b69e1')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    mv "${pkgdir}/opt/Redis Insight" "${pkgdir}/opt/RedisInsight"

    install -Dm755 redisinsight.sh "${pkgdir}/usr/bin/redisinsight"

    sed -i 's|"/opt/Redis Insight/redisinsight"|/usr/bin/redisinsight|g' "${pkgdir}/usr/share/applications/redisinsight.desktop"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/redisinsight/LICENSE"
}
