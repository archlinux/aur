# Maintainer: d6k283tix <d6k283tix@mozmail.com>

pkgname=navicat17-premium-en
pkgver=17.0.2
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. ( English )"
arch=(x86_64)
url='https://navicat.com/en/navicat-17-highlights'
license=('NOASSERTION')
source=(
    "navicat17-premium-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-$CARCH.AppImage"
    "navicat17.desktop"
)
sha256sums=(
    '53580b0099c7209a914c4ca89becb16f1812c67849992ec83ce28863f988db84'
    '3e430812b781e63c406ae4a4acc7e68d80af48c12c5032c8282fd7fe6239d978'
)

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
