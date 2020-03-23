# Maintainer: sudhip nashi (sudhip@nashi.us)
pkgname='gmail-nativefier'
pkgbase='google-mail-nativefier'
pkgver=1.0
pkgrel=1
pkgdesc="Google Mail wrapped as a desktop application"
arch=('x86_64')
url=https://mail.google.com
license=('MIT')
makedepends=(npm nodejs-nativefier nodejs)
source=('gmailicon.png'
        'gmail.desktop')
sha256sums=(fbe8559ad3b4307678250a671b8c259adf8ded119c8d133d1b706f0f4879a051
            00903986203291fe7a6636562ac24ebb62854a7b03fdf7e3039906b753b9f68e)

appname=gmail-desktop
        
build() {
    nativefier "https://mail.google.com/" \
    --icon gmailicon.png \
    --maximize \
    --show-menu-bar \
    --single-instance \
    --name $appname
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 gmail.desktop "$pkgdir"/usr/share/applications/$appname.desktop
    
    cp -rL $appname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$appname "$pkgdir"/usr/bin/$appname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$appname.png
    
    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
