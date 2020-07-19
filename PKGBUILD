# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=78.0.2
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=78')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('564f6c1dd830a7fa0b5461b3f3ce1f9293d5844de76e61121683e9c3562b69880d237f58001f7b62a2d29ac4c758524374f637f5231629fda84fa216fa2c1ff6'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='7e5209d8b439049b5276a7f602ed9d36c58e8d8b481d64071401550a9e83e873487bf4f3be338deb0ccd6deba008a37ddb4eaa25724101f70cbf6f82861f6ac6'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=68.10.0
    provides=('firefox=68')
    sha512sums[0]='22e241f9506cf03eebb2c58f0d70df960fef970e1652769e68893226a038d54bbbb8d9fce06a15299ab04e91f2b33e4f76533fa3d2445a57441de98316f55db1'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='83304b8d190c02d892f0fadb6721600447351ba6b2dfec4d04cfeaca88b3c6559572d202f07074095b318254c897ec0a31384f254d7f9119449e992fe1b61fdf'
fi

source=(https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
	install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
