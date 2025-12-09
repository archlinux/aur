# Maintainer: petehsu <your_email@example.com>
pkgname=void-editor-bin
pkgver=1.99.30044
pkgrel=1
pkgdesc="The AI IDE for prototype to production (Binary release)"
arch=('x86_64')
url="https://void.editor"
license=('custom')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'libxtst' 'xdg-utils')
provides=('void-editor')
conflicts=('void-editor')
# 这里使用了你刚才提供的 URL
source=("void-editor.deb::https://github.com/voideditor/binaries/releases/download/${pkgver}/void_${pkgver}_amd64.deb")
sha256sums=('SKIP') # 既然是本地自己用，我们先跳过校验码，方便省事

package() {
    # 1. 解压 deb 包里的 data.tar.xz 到安装目录
    # 注意：makepkg 会自动把 .deb 解压成 data.tar.xz，我们只需要解压这个 data 文件
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    
    # 2. 修正一下权限 (防止文件只读)
    chmod -R 755 "${pkgdir}/usr"
}
