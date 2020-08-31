# Maintainer: Charles Samborski <demurgos@demurgos.net>
# Contributor: Manuel Kauschinger <admin at bruzzzla dot de>
# Contributor: Will Adams <info at clementlumber dot com>
# Contributor: T. Jameson Little <t.jameson.little at gmail dot com>
# Contributor: Stephen Michael <ihateseptictanks at gmail dot com>
# Contributor: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr68-bin
_pkgname=${pkgname/-bin/}
pkgver=68.12.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release - Version 68'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=68')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('d71d18a430c3deda64533d7330974c90355bd25fda774b4267dabeb5ce54d6a9056f236abfbe99eb66ed0290eda5e45a6772110e7d283593fd66e950fc8f2277'
            '1566a237a5ff457d26107ee8fd02687434b55b4083e677a59ddc560bc67517270de09b180d916f5a8e38bd05525b54b9917775580db0263bc4f534805577da94'
            '74108af04676ecb31cf4c9c92db28ce7431b5bcea661999d078dfce1368aa7acc5f058c72e33ef7ca0537ed23ce80772d8d8adc431fca86fcd876f8d8ba2704d')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='8b1e66019dd18a665c4fc6219747ed2e2f0f2070cffefdebe32b41118e60f235bdcbdb72ad5ecf58314c114bae8bdbe55399d7cfb9ad2493c47d0da2cfbe61b7'

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
