# Maintainer: Kaio Augusto <kaioaugusto.8@gmail.com>
# Contributor: welblade 
# Based on package of: Manuel Kauschinger <admin at bruzzzla dot de>

pkgname=firefox-esr-pt-br-bin
_pkgname=firefox-esr
pkgver=68.0.1
pkglang=pt-BR
pkgrel=1
pkgdesc='Instalação autônoma do navegador de internet da mozilla.org, edição de suporte de longo prazo, traduzido para o português do Brasil.'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=68' firefox-esr=$pkgver)
conflicts=('firefox=68' firefox-esr=$pkgver firefox-esr-bin) 
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

source=($_pkgname.desktop 
               $_pkgname-safe.desktop)

source_x86_64=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-x86_64/${pkglang}/firefox-${pkgver}esr.tar.bz2)
source_i686=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-i686/${pkglang}/firefox-${pkgver}esr.tar.bz2)

sha512sums=('f1edf5aaeec7edf5bf1be6155c4b417190c520eeb826b63107ac0ac99e7df1800f237ed7ced35e44e9d6809b142582e4fcb4e033f8d91d445486d35d1314705c'
            '2cb650cf7c16db64e5d540db798799c569837a430a8573d86d3a120cdb59ef28bcd3959990ee5b946b21694f0deb84b527cc99a7d071002d6d33d6627cb10621')
sha512sums_i686=('3843c9d4e342c80d9b4cbaa621417e9d86aecd67e29a8f96e139bdf235bbc269f16864e986c18ec9473740dc68a5b454cda88ff30df68151a70cea7b962f633c')
sha512sums_x86_64=('3843c9d4e342c80d9b4cbaa621417e9d86aecd67e29a8f96e139bdf235bbc269f16864e986c18ec9473740dc68a5b454cda88ff30df68151a70cea7b962f633c')


package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname
    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
