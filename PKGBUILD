# Maintainer: odnmalau <odnmalau@gmail.com>

pkgname=navicat17-premium-en
pkgver=17.3.3
pkgrel=1
pkgdesc="Manage and Develop Your Databases"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com/en/products/navicat-premium'
license=('custom')
source=("navicat17.desktop")
source_x86_64=("navicat17-premium-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-x86_64.AppImage")
source_aarch64=("navicat17-premium-en-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-aarch64.AppImage")

sha256sums=('7b0dbf7ce350724266cc4d4648abd0092a765b013f349aa98fd61d32fe8d8d3e')
sha256sums_x86_64=('8175e3d855cec36387513697e5762d774fe72ff13f84d99c9af7344c368e0944')
sha256sums_aarch64=('d7c25b50957c8c05d189555eadf6192ec8f2fb92b60e3c2a018f87aa3b659df8')

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir
    cd $srcdir
    chmod +x $srcdir/navicat17-premium-en-$CARCH-${pkgver}.AppImage
    ./navicat17-premium-en-$CARCH-${pkgver}.AppImage --appimage-extract
    cp -r squashfs-root/usr $_na_dir
    install squashfs-root/AppRun $_na_dir
    cp squashfs-root/manual.pdf $_na_dir
    install -d $pkgdir/usr/share/applications
    cp $srcdir/navicat17.desktop $pkgdir/usr/share/applications
    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    ln -s /$_root_na_dir/$_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat17.png
}
