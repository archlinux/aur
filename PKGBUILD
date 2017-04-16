# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
realver=1.0.0-rc.3
pkgver=${realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gtk2' 'dbus' 'libxi' 'libxcursor' 'libxdamage' 'libxrandr'
	 'libxcomposite' 'libxext' 'libxfixes' 'libxrender' 'libxtst'
	 'gconf' 'glib2' 'nss' 'xz' 'fuse2')
optdepends=('libnotify: for notifications'
	    'speech-dispatcher: for text-to-speech')
source=("etcher.in"
	"Etcher.desktop"
	"etcher.png")
source_i686=("https://resin-production-downloads.s3.amazonaws.com/etcher/$realver/Etcher-$realver-linux-x86.zip")
source_x86_64=("https://resin-production-downloads.s3.amazonaws.com/etcher/$realver/Etcher-$realver-linux-x64.zip")
options=("!strip")
md5sums=('45deb94dca8036000f4c03a1634929ee'
         'bba3a3ed1d8ea4d3a9d1ad642dad3225'
         '7bd70ef05c6293e36938240be2558091')
md5sums_i686=('d7364da3620e78940536b84979282b31')
md5sums_x86_64=('704eb4578c4110d1cf9847ac695363cb')

build() {
    local a=x86
    [ "$pkgarch" == "x86_64" ] && a=x64

    sed "s/##AppImage##/Etcher-$realver-linux-$a.AppImage/g" etcher.in > etcher
}

package() {
    local a=x86
    [ "$pkgarch" == "x86_64" ] && a=x64

    install -D "$srcdir/etcher" "$pkgdir/usr/bin/etcher"
    install -D "Etcher-$realver-linux-$a.AppImage" "$pkgdir/usr/share/etcher/Etcher-$realver-linux-$a.AppImage"
    install --mode=644 -D "$srcdir/etcher.png" "$pkgdir/usr/share/etcher/etcher.png"
    install -D "$srcdir/Etcher.desktop" "$pkgdir/usr/share/applications/Etcher.desktop"
}
