#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nutstore
pkgver=4.1.4
pkgrel=2
pkgdesc='a cloud service that lets you sync and share files anywhere.'
arch=(x86_64)
url='https://jianguoyun.com/'
license=(custom)
depends=(libappindicator-gtk3 libnotify python-gobject)
optdepends=('nautilus-nutstore: Nautilus plugin')
source=(nutstore license)
sha256sums=('3091740b20ddd31ba4407b8daba1077c4677040cdc47bccfab2f7f3947676384'
            'f3d2861ff48f2d193a4eced23a02b4eba9fab4c1d3f727e934ed7c59f38f0f7e')
source_x86_64=('https://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x64.tar.gz')
sha256sums_x86_64=('b0ec672174b7f3d100d41bb6ab8768d45cfb36aef47b5e80a3560bec8842bf84')
#source_i686=('https://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x86.tar.gz')
#sha256sums_i686=('4c876e0e906f8a168549718d43d59a7a0492771275c5dd20f564998fdb3953d1')

build() {
    cd $srcdir/gnome-config
    sed -i '/Exec=/s|~/\.nutstore/dist/bin/nutstore-pydaemon.py|/usr/bin/nutstore|' menu/nutstore-menu.desktop
    sed -i '/Exec=/s|~/\.nutstore/dist|/opt/nutstore|' autostart/nutstore-daemon.desktop
}

package() {
    cd $srcdir
    install -D -m755 nutstore $pkgdir/usr/bin/nutstore
    install -D -m644 license $pkgdir/usr/share/licenses/$pkgname/license
    rm nutstore license *.tar.gz
    mkdir -p $pkgdir/opt/$pkgname && cp -aR ./ $pkgdir/opt/$pkgname
    install -D -m644 gnome-config/menu/nutstore-menu.desktop $pkgdir/usr/share/applications/nutstore.desktop
    install -D -m644 app-icon/nutstore.png $pkgdir/usr/share/icons/hicolor/64x64/apps/nutstore.png
}
