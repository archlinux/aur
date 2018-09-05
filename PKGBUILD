# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=60.2.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=60')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('e45efd0be973ad546000ffd4b6c00729958dee8bd01fef2ecf2f22c2249764c6167db09bab5e4ef68ac7f25485920167e49793b76e908a2310b07b9c923236f0'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='bfdcc52df3cbfbc09b263ca3c99581d3be25a219eb762da3aae1024d2164975ee70296216accfc7c574a84613e258af24a35fb65cdcc039a863f1bf16519bad9'

if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    pkgver=52.9.0
    provides=('firefox=52')
    sha512sums[0]='b5d7da00766354e72f5a48f4f2143623428256d79d0b3e958ed6764b680afdf2b3188c61b09a02dd1537c8b8d3ddd1a1b828b1cc13a16df02a52538a42c62954'
    [[ "$CARCH" == "i686" ]] && sha512sums[0]='d79751dc00ed40a22ebcb28335045ef1a722a8a6f1dbc1833c917506371f12a41cbb230eb31035f50a0bbf22fa0bff539136ba7776eb823d6f7ff103fb16e54f'
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
    #if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    #    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    #else
	install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    #fi
}
