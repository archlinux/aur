# Maintainer: odnmalau <odnmalau@gmail.com>

pkgname=navicat17-premium-en
pkgver=17.3.1
pkgrel=2
pkgdesc="Manage and Develop Your Databases"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com/en/products/navicat-premium'
license=('custom')
source=("navicat17.desktop")
source_x86_64=("navicat17-premium-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-x86_64.AppImage")
source_aarch64=("navicat17-premium-en-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-aarch64.AppImage")

sha256sums=('7b0dbf7ce350724266cc4d4648abd0092a765b013f349aa98fd61d32fe8d8d3e')
sha256sums_x86_64=('e6f19cb696c083799585a96bf9883788564d0b263ed3e6bdf2c95d854707926d')
sha256sums_aarch64=('af7d6efdbff71cef4f110b48afd019ff9355ad172027e1800873d608809961e7')

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
