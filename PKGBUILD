#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nutstore-experimental
pkgver=3.3.2
pkgrel=1
pkgdesc='Nutstore experimental version.'
arch=(x86_64 i686)
url='https://jianguoyun.com/'
license=(custom)
depends=(gtk2
         java-runtime
         python2-notify)
optdepends=('nautilus-nutstore: Nautilus plugin')
install='nutstore.install'
source=(license)
source_x86_64=("https://jianguoyun.com/static/exe/ex/$pkgver/nutstore_client-$pkgver-linux-x64.tar.gz")
source_i686=("https://jianguoyun.com/static/exe/ex/$pkgver/nutstore_client-$pkgver-linux-x86.tar.gz")
md5sums=(3d2b5207cb2f8faeb22625976953151d)
md5sums_x86_64=(36dd79961502afaef2d5d82f7909400e)
md5sums_i686=(f9a180369f6ceef58cf4f2cc20355ad4)
conflicts=(nutstore)
provides=(nutstore)

build()
{
    cd $srcdir
    sed -i -e '1s/python/python2/' bin/nutstore-pydaemon.py
    cd gnome-config
    sed -i -e '/Exec=/s,~/\.nutstore/dist,/opt/nutstore,'\
        menu/nutstore-menu.desktop autostart/nutstore-daemon.desktop
}

package()
{
    cd $srcdir
    install -D -m 644 license $pkgdir/usr/share/licenses/nutstore/license
    rm license *.tar.gz
    mkdir -p $pkgdir/opt/nutstore && cp -aR ./ $pkgdir/opt/nutstore
    install -D -m 644 gnome-config/menu/nutstore-menu.desktop\
        $pkgdir/usr/share/applications/nutstore-menu.desktop
    install -D -m 644 app-icon/nutstore.png\
        $pkgdir/usr/share/icons/hicolor/64x64/apps/nutstore.png
}
