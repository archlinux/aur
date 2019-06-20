# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=60.7.2
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk2' 'gtk3' 'libxt' 'dbus-glib' 'nss')
makedepends=()
provides=('firefox=60')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('300f0c401d76064dfffc698e82f1b9a3656089f301daf46bece597d23a9480bb0e6bdc419eb1efc1a66206f2a06f63b42243d1a812cec4b6d8ed9c1d0dbbbdbc'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='1347b99a0bed2c540a47526eab83df0fbb2188af0e486111939b64c0abe9a74565f3e72763df0cf6a6890d31708fbdd8f1405440ff21af661458f0dc990db3c9'

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
