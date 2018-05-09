# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=52.8.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=52')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('f9b7084c8ad779cb434f550e1b2f1437cbb200c90ef110aece263124f934e8e589d237e956614fd082275c6ced5ac530979d318c7399aec183c75c136cfef8ab'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='2b41c7b5746254d083094ce6df59d4ecc13a7dd89b052ea930002a1953bdccdd532d9c5ece4bc52686ffae7f35df485f3d4eea0e36abade5dc2e10a868cbfc49'

# if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    # pkgver=38.8.0
    # provides=('firefox=38')
    # sha512sums[0]='644dec9233a30b8929e8eb38aecab6f78be234c08c62fa038f7c8f5b8bdfed50ba053a402f92747e730147107d6e3408a21641de93792d35dc87967017065c90'
    # [[ "$CARCH" == "i686" ]] && sha512sums[0]='25bd1f1be5c62b3b5acfae25bfefdb87ea20594730f1dec43ddec4af3d56b1b5b586c78f28595cda9c15904eb8d0b4806c312337d48d872361769a4fc81e3df3'
# fi
source=(http://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.bz2
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
