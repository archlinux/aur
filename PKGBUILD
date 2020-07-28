# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=78.1.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=78')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('7ec97105c047b4935cf1354811c67d307f5d1c3091b83913efc1bfc4ec44d4407570aba39808ff456974236c3af6f9040a83966fe249d0d0be94f27291384d25'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='70e12d9dccf0d139ed27bf4df22d375a1f8f623807f82b0485826afa55660d72456bd598fd26da25f6ce40c565b9c964a03d2db008084824fbae762cacbbe845'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=68.11.0
    provides=('firefox=68')
    sha512sums[0]='1eefd8f0de8ace89eeb6f01c3cd9a491eaa7a408095bf9abed46c50ead7c9a5958bc098432f5911980e6e0193da3aa8b8eefd353df322a0bc944f51bcdd31977'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='fa67ee3c9018596109005ffff13cc87a3b1a6d6407ea276b823d05480dda5263d168b9759688b140221cf58b1ce1f3059e3dede341db0d9f1a9e4ad593a4c50c'
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
