# Maintainer: yaua <phungngoctho at gmail dot com>
pkgname="zalo-nativefier"
pkgver="1.0"
pkgrel="1"
pkgdesc="Zalo desktop built with nativefier (electron)"
arch=('armv7l' 'i686' 'x86_64')
url="https://chat.zalo.me"
license=('custom')
makedepends=(npm nodejs-nativefier nodejs)
source=(
  "zalo-nativefier.png"
  "zalo-nativefier.desktop")
md5sums=('SKIP')
appname=zalo-nativefier
  
build() {
    nativefier "https://chat.zalo.me/" \
    --icon Zalo-nativefier.png \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    --name $appname
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 zalo-nativefier.desktop "$pkgdir"/usr/share/applications/$appname.desktop
    
    cp -rL $appname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$appname "$pkgdir"/usr/bin/$appname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$appname.png    
    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
    sed -i 's/!options.saveAs/options.saveAs/g' "$pkgdir"/opt/$pkgname/resources/app/lib/main.js
}


md5sums=('4c951a02d1cb7f66ec070a8b175bf989'
         'e697df9b4823810731a500a4d178a04f')
