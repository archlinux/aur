# Maintainer: Ambition_echo <ambition_echo@outlook.com>

resname=earth_wallpaper
pkgname=earth-wallpaper-nightly
name=earth-wallpaper
pkgver=2.0.1
pkgrel=0
pkgdesc="Simple and easy to use multifunctional wallpaper software 简单好用的多功能壁纸软件"
arch=('x86_64')
url="https://jihulab.com/ambition-echo/earth_wallpaper"
license=('GPL3')

depends=('dbus-python' 'python' 'python-pillow' 'python-requests' 'pyside6')

source=(
    "git+$url.git"
    "$name.desktop"
    )
sha256sums=(
    "SKIP"
    "cf4764128b5fffe69ed3bbaf53e107f9359050f3d4580d33d136db4b1fa3fe9b"
    )

prepare() {
    cd $srcdir/$resname/$resname
    sed -i "s/2..0..1/$(git describe --tags |  sed  's/\([^-]*-g\)/r\1/;s/-/./g')/g" about.py
}

package() {
    install -Dm644 ./$name.desktop $pkgdir/usr/share/applications/$name.desktop
    cd $srcdir/$resname
    mkdir -p $pkgdir/opt/$pkgname/$resname
    cp -r $resname/* $pkgdir/opt/$pkgname/$resname
    chmod +x $pkgdir/opt/$pkgname/$resname/main.py
}
