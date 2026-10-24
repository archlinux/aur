# Maintainer: Xynrin <xynrin@outlook.com>
#
# 新架构（Go + Wails）的 Linux 预编译包。
#
# 为什么单独叫 -wails：仓库同时还在发 Electron 版；两者产物与依赖都不同。
# 这份用的是链接 webkit2gtk-4.1 的构建（Arch 仓库只有 4.1，4.0 已不再提供），
# 对应的 release 资产名带 `-webkit41-` 后缀。
pkgname=downvid-wails-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Modern video downloader GUI for yt-dlp/ffmpeg (Wails new architecture, prebuilt)"
arch=('x86_64')
url="https://github.com/Downvid/downvid"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3')
provides=('downvid')
conflicts=('downvid' 'downvid-bin' 'downvid-wails')
# 预编译产物：不要再 strip，也不需要 debug 包
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/DownVid-Wails-linux-x64-webkit41-$pkgver.tar.gz"
        "downvid.desktop"
        "downvid.png::https://raw.githubusercontent.com/Downvid/downvid/v$pkgver/app/build/appicon.png"
        "LICENSE::https://raw.githubusercontent.com/Downvid/downvid/v$pkgver/LICENSE")
sha256sums=('74fd77ffe4570770765ba4baa8bb9c5c9255cb46536951638c54e18577f060fc'
            'c855a03b2ac0fee9b9b5881ac1b705cb43e1d7640dd6a3a9b021c8669a1ecca9'
            '738c724e45f067bcfb8eb6bbecf5141450de8af197da2b833618ca06754df7ba'
            'c142ff2ccd9a9db6a737e3b8450bc676e72409b753d018982b8c5045f73c1704')

package() {
  install -Dm755 "$srcdir/downvid" "$pkgdir/usr/bin/downvid"
  install -Dm644 "$srcdir/downvid.desktop" "$pkgdir/usr/share/applications/downvid.desktop"
  install -Dm644 "$srcdir/downvid.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/downvid.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
