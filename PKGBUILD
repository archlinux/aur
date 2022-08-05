# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=earth-wallpaper-bin
appid=cn.huguoyang.earthwallpaper
name=earth-wallpaper
pkgver=1.6.1
pkgrel=0
pkgdesc="实时获取地球照片作为桌面壁纸"
arch=('x86_64')
url="https://jihulab.com/ambition-echo/earth_wallpaper"
license=('GPL3')
source=("https://jihulab.com/api/v4/projects/40487/packages/generic/earth_wallpaper/$pkgver/earth-wallpaper-deepin-amd64-$pkgver.deb")
sha256sums=('SKIP')
depends=('qt5-base' 'python' 'python-pillow' 'python-requests')
build() {
    bsdtar -xpf "$srcdir/earth-wallpaper-deepin-amd64.deb"
    bsdtar -xpf "$srcdir/data.tar.xz"
}
package() {
    cd $srcdir
    sed -i "s/Exec=.*/Exec=\/opt\/$pkgname\/$name/g" ./opt/apps/$appid/entries/applications/$appid.desktop
    sed -i "s/Icon=.*/Icon=\/opt\/$pkgname\/icon.png/g" ./opt/apps/$appid/entries/applications/$appid.desktop

    install -D ./opt/apps/$appid/files/bin/$name $pkgdir/opt/$pkgname/$name
    install -D ./opt/apps/$appid/files/bin/scripts/* -t $pkgdir/opt/$pkgname/scripts
    install -D ./opt/apps/$appid/files/bin/template/* -t $pkgdir/opt/$pkgname/template

    install -D ./opt/apps/$appid/entries/icons/hicolor/256x256/apps/$appid.png $pkgdir/opt/$pkgname/icon.png
    install -D ./opt/apps/$appid/entries/applications/$appid.desktop $pkgdir/usr/share/applications/$name.desktop
}
