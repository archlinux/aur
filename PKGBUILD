# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Will Adams <info at clementlumber dot com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-eme-free-bin
_pkgname=${pkgname/-bin/}
pkgver=53.0.3
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
sha512sums=('8d812b47f6316fbb5ec8acbc2b068082ad7aed3976069d2cb10571434047fa90d3dd840591e3a776762f4b27e6f01b1fb1b0c17140335f830b977091c816efe5'
            'faecc006b7c7d95d20430492530a598f4a69e71461833082ba6de68fe17d3b76e64f416fe0e00b06ded5e658c59a3e7b9c6fb24628a9944724d46e05545f1a18')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='54f6cfc72d605666af0b96f1cacc5d91ca87dc861ffaa00a916077eca3103bf42e6556ac02e1482a5dbdb15739d69ee255b3a168fadbb0ba1d3cd2d70b1b4859'
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-x86_64-EME-free/en-US/firefox-${pkgver}.tar.bz2
        $_pkgname.desktop) 

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
