# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=153.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss' 'ffmpeg4.4')
makedepends=()
provides=(firefox=${pkgver})
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('eea6a3ca2fdd93ae8f2a7e21c8792372faccb8591588cc983aacdebb34b0735f8d26eff54b6a6185dce9160add27052bef05a6a635ec286f184579d75cbcd6db'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='439b8829a98ec5c5c7c47f1b5815160f20748fb1166711df14888dc663e945311c7a1085fa2e44c4a5da590dcfc034774a8bd46c6b78f4f195d9e8924acc2893'

source=(https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.xz
        $_pkgname.desktop 
        $_pkgname-safe.desktop
        policies.json)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/chrome/icons/default/default128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    mkdir $pkgdir/opt/$_pkgname/distribution
    install -m644 $srcdir/policies.json $pkgdir/opt/$_pkgname/distribution/policies.json
}



