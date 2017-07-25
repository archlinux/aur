# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
realver=1.1.1
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
source_i686=("https://github.com/resin-io/etcher/releases/download/v$realver/etcher-$realver-linux-x86.zip")
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v$realver/etcher-$realver-linux-x64.zip")
options=("!strip")
sha256sums=('48232d91a275df4f09249aad2b43af3e71e8436bda49c79b591e92e4f3a33922'
            'a271329e1f3dc952ab43cc3364794e7db0e62990f3e929df3e275e39c28d3980'
            '6c47238675cae3c7e580a62cc836a56eb44ace1346607896f1fe16c2185f3c06')
sha256sums_i686=('80c4f664968804d85b147bccb6d5c4847d9f9b90bdcc7415801ff7a643ef89b3')
sha256sums_x86_64=('120782ccc3a4971bb5893738c4ac74a48566cd71212995dd1fd21cc022f85ef8')


appimage() {
  a=${pkgarch/i686/i386}
  echo "etcher-$realver-$a.AppImage"
}

build() {
    sed "s/##AppImage##/$(appimage)/g" etcher.in > etcher
}

package() {
    install -D "$srcdir/etcher" "$pkgdir/usr/bin/etcher"
    install -D "$(appimage)" "$pkgdir/usr/share/etcher/$(appimage)"
    install --mode=644 -D "$srcdir/etcher.png" "$pkgdir/usr/share/etcher/etcher.png"
    install -D "$srcdir/Etcher.desktop" "$pkgdir/usr/share/applications/Etcher.desktop"
}
