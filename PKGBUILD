# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=78.3.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=78')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('bc435663b80b6edc328b8fbc076a968cbeca9353773d9ad4abfa0a1b2c342f0b75b433bd25faa9c958513ba3f039343d5a4df18eeb0ac75bc33633c2628fdbe6'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='8fb2f3b0bc68636303a4596b2957e2680202ff5501602791c423e5a120ab787dcc2e93480e5b8e649e72ee233b0553dee940cfe7a928ca5de9ed76166c9f67cb'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=68.12.0
    provides=('firefox=68')
    sha512sums[0]='d71d18a430c3deda64533d7330974c90355bd25fda774b4267dabeb5ce54d6a9056f236abfbe99eb66ed0290eda5e45a6772110e7d283593fd66e950fc8f2277'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='8b1e66019dd18a665c4fc6219747ed2e2f0f2070cffefdebe32b41118e60f235bdcbdb72ad5ecf58314c114bae8bdbe55399d7cfb9ad2493c47d0da2cfbe61b7'
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
