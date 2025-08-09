# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=chhsich-nerd-font
pkgver=1.0.0
pkgrel=1
pkgdesc="A custom Nerd Font combining ComicShannsMono's English characters with Maple Mono NF CN's Chinese support"
arch=('any')
url="https://github.com/ChHsiching/chhsich-nerd-font"
license=('OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
provides=('ttf-chhsich-nerd-font')
conflicts=('ttf-chhsich-nerd-font')
replaces=('ttf-chhsich-nerd-font')
source=("$pkgname-$pkgver.zip::https://github.com/ChHsiching/chhsich-nerd-font/releases/download/v$pkgver/ChHsichNerdFont-v$pkgver.zip")
sha256sums=('SKIP')
install="$pkgname.install"

package() {
    # 创建字体目录（与原始install.sh保持一致）
    install -dm755 "$pkgdir/usr/share/fonts/ChHsichNerdFont"
    
    # 复制字体文件到正确的目录
    install -m644 "$srcdir"/*.ttf "$pkgdir/usr/share/fonts/ChHsichNerdFont/"
    
    # 创建字体配置目录
    install -dm755 "$pkgdir/etc/fonts/conf.avail"
    install -dm755 "$pkgdir/etc/fonts/conf.d"
    
    # 创建字体配置文件
    cat > "$pkgdir/etc/fonts/conf.avail/66-$pkgname.conf" << EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/usr/share/fonts/ChHsichNerdFont</dir>
</fontconfig>
EOF
    
    # 创建符号链接
    ln -s "../conf.avail/66-$pkgname.conf" "$pkgdir/etc/fonts/conf.d/66-$pkgname.conf"
} 