# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-hexhub-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="HexHub - 为程序员和运维人员量身打造的一站式开发运维利器（Database, Docker, SSH, SFTP）"
arch=('x86_64')
url="https://www.hexhub.cn"
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'libcups'
    'libdrm'
    'libsecret'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nss'
    'pango'
    'xdg-utils'
)
optdepends=(
    'libappindicator-gtk3: 系统托盘图标支持'
    'libayatana-appindicator: 系统托盘图标支持（Ayatana）'
)
provides=('hexhub')
conflicts=('hexhub')
options=('!strip')

source_x86_64=("HexHub-amd64-deb-${pkgver}.deb::https://oss.hexhub.cn/plugin/HexHub-amd64-deb-${pkgver}.deb")
sha256sums_x86_64=('a616a4e489feb7bea65e10feca1f0d569568de92442abfffcb1885a44190eb79')

package() {
    cd "$srcdir"

    # 解压 .deb 文件
    ar x "HexHub-amd64-deb-${pkgver}.deb"

    # 将 data.tar.xz 解压到 $pkgdir
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # 创建 /usr/bin/hexhub 符号链接
    install -d "$pkgdir/usr/bin"
    ln -sf '/opt/hexhub/HexHub' "$pkgdir/usr/bin/hexhub"
}
