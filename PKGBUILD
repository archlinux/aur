# Maintainer: Alexandria Pettit(alxpettit@gmail.com)
pkgname='google-voice-nativefier'
pkgbase=$pkgname
pkgver=1.1
pkgrel=1
pkgdesc="Google Voice wrapped as a desktop application through Nativefier"
arch=('x86_64')
url=https://voice.google.com
license=('MIT')
makedepends=(npm nodejs-nativefier nodejs)
source=('icon.png' 'run.desktop' 'counter.js')
sha256sums=('44bd668b8f1e85909bb36ad6e464a95046854cb8c573e1343c03edebadc653cd'
            '60ea1946aab2c27dcef657afd6cadcf7f88415b4c0ecaaae9326f2ec6631451b'
            '8d0d2d0a9b2d59bac46d38ec4262f6b9979aed57d3d4f1d46fe91506d10b753b')

appname=google-voice-desktop
        
build() {
    nativefier "voice.google.com"  --name $appname \
        --icon icon.png \
	--user-agent " Mozilla/5.0 (Windows NT 10.0; rv:103.0) Gecko/20100101 Firefox/103.0" \
	--counter --inject counter.js
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 run.desktop "$pkgdir"/usr/share/applications/$appname.desktop
    
    cp -rL $appname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$appname "$pkgdir"/usr/bin/$appname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$appname.png    
    chmod 644 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
