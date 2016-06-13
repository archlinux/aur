# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Will Adams <info at clementlumber dot com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-eme-free-bin
_pkgname=${pkgname/-bin/}
pkgver=47.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - EME free release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('x86_64')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' 'gconf')
optdepends=('libgnome: fixes file association/default browser issues on GNOME desktops.'
			'gstreamer0.10: HTML5 video'
			'gstreamer0.10-good-plugins: h.264 video'
			)
provides=('firefox-eme-free')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install
sha512sums=('d67f26f0c7eccc69cce4cbe62dce12eca667c0535df6d97bd35792d18541969b07674677f007e76f9a7c2aeebc58511f6cdfe59679d41e620a493b5ff19edc91'
            'ff7ecb22e93e3909da6a756c08a004795037cad8512d39d831a2afd758233d5b816db8d96fa3e02f672ea810d50add49d07d130ed17081a01d14899965288f54'
            'c202303c3a7634f69e82b45ca7c4d8e14d08f35215aad69bf3cccd1cfcb9ba6ff548c6994058e83c121f83d0200efa597f381370a6efcebcd171ef0f8c8f73cc')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='54f6cfc72d605666af0b96f1cacc5d91ca87dc861ffaa00a916077eca3103bf42e6556ac02e1482a5dbdb15739d69ee255b3a168fadbb0ba1d3cd2d70b1b4859'
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-x86_64-EME-free/en-US/firefox-${pkgver}.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
