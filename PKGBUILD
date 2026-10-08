# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>

pkgname=wegame-launcher
pkgver=0.2.0
pkgrel=1
pkgdesc='开箱即用的简易 WeGame 启动器，使用 WE-Proton 运行'
arch=('any')
url='https://github.com/SHORiN-KiWATA/wegame-launcher'
license=('GPL-3.0-only')
# Proton 不经过 Steam 运行时直接运行，Wine 运行时加载的库由系统提供：
# X11（显示）、freetype/fontconfig（文字）、gnutls（HTTPS）、Vulkan（DXVK）是 WeGame 必需的。
depends=('python' 'python-gobject' 'gtk4'
         'libx11' 'libxext' 'libxrandr' 'libxrender' 'libxi' 'libxcursor' 'libxinerama'
         'libxcomposite' 'libxfixes' 'libxxf86vm' 'freetype2' 'fontconfig' 'gnutls'
         'vulkan-icd-loader')
optdepends=('vulkan-driver: 显卡的 Vulkan 驱动（DXVK 渲染需要）'
            'libglvnd: OpenGL'
            'libpulse: 声音'
            'xdg-utils: 在文件管理器里打开文件夹'
            '7zip: 解压 WeGame 离线安装包（没有时自动下载）'
            'gamescope: run WeGame nested in its own compositor'
            'mangohud: performance overlay')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c38126214df3bd21353bd57175c04c6bb2ca1a884d16f1b7f04a050a326e2bf')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 wegame-launcher -t "$pkgdir/usr/bin"
    install -Dm644 wegame-launcher.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 wegame.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/wegame.png"
}
