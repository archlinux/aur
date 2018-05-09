# Maintainer: welblade 
# Based on package of: Manuel Kauschinger <admin at bruzzzla dot de>

pkgname=firefox-esr-pt-br-bin
_pkgname=firefox-esr
pkgver=52.8.0
pkglang=pt-BR
pkgrel=1
pkgdesc='Instalação autônoma do navegador de internet da mozilla.org, edição de suporte de longo prazo, traduzido para o português do Brasil.'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=52' firefox-esr=$pkgver)
conflicts=('firefox=52' firefox-esr=$pkgver firefox-esr-bin) 
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

source=($_pkgname.desktop 
               $_pkgname-safe.desktop)

source_x86_64=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-x86_64/${pkglang}/firefox-${pkgver}esr.tar.bz2)
source_i686=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-i686/${pkglang}/firefox-${pkgver}esr.tar.bz2)

sha512sums=('f1edf5aaeec7edf5bf1be6155c4b417190c520eeb826b63107ac0ac99e7df1800f237ed7ced35e44e9d6809b142582e4fcb4e033f8d91d445486d35d1314705c'
            '2cb650cf7c16db64e5d540db798799c569837a430a8573d86d3a120cdb59ef28bcd3959990ee5b946b21694f0deb84b527cc99a7d071002d6d33d6627cb10621')
sha512sums_i686=('5fb864ae77c8e5fc32364660cef9e08da893e9379b16670e97a6fd5d1857fa0283eb9396f0aee6e1bd9b811a3460d32a92e27250b117fb236737189beb03afbf')
sha512sums_x86_64=('ec44a0217481ac7db532ac5dc160e53d6e95c3897045ef556d0a864d4857c137a03ae1898217d607e477d231a732644d88bad0205ccc0979edad4c65035bb0cb')


package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname
    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
