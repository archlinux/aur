# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-dida-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="滴答清单 - 跨平台 Todo & Task Manager"
arch=('x86_64')
url="https://dida365.com"
license=('LicenseRef-proprietary')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret')
optdepends=('libappindicator: 系统托盘图标支持'
            'libayatana-appindicator: 系统托盘图标支持（Ayatana）')
provides=('dida' 'dida365')
conflicts=('dida' 'dida365')
options=('!strip')

source_x86_64=("dida-${pkgver}-amd64.deb::https://dida365.com/static/getApp/download?type=linux_deb_x64")
sha256sums_x86_64=('58614aeea4b48e714739a39e5c415af24ba231bd6020b94eb9f4dcca2e414a1f')

package() {
    cd "$srcdir"

    # 解压 .deb 文件
    ar x "dida-${pkgver}-amd64.deb"

    # 将 data.tar.xz 解压到 $pkgdir
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # 创建 /usr/bin/dida 符号链接（postinst 里做的事）
    install -d "$pkgdir/usr/bin"
    ln -sf '/opt/dida/dida' "$pkgdir/usr/bin/dida"

    # 设置 chrome-sandbox 的 SUID（Electron 5+ 必须）
    chmod 4755 "$pkgdir/opt/dida/chrome-sandbox"
}
