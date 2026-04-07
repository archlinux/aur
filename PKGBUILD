# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=140.9.1
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss' 'ffmpeg4.4')
makedepends=()
provides=(firefox=${pkgver})
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('e465131bfffcf0ebc37057a4dc9539ac5758701c0054478118333b0d6af84578343b31cfda51f1af8b09ac6e4d1b8a6a7d5ee05a5fd1e8f05934b334696f0f41'
            'c585f6e8ac7abfc96ad4571940b6f0dcc3f7331a18a518b4fe5d19b45e4c2d96c394524ea5c115c8fdd256c9229ea2fabeb1fc04ca7102f1626fd20728aef47d'
            'ab2fa2e08c7a65ac0bfe169a4b579e54b038bddabf838cd3df5ab341bd77be7c101092d0123598944d2174ab3a8fbc70dfbd692b2944016efdb7a69216a74428'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='f409e2bd0e19b9bd7f0605fc86e3e5777ed6a452419372c0ce802f50592e8d122193327786c11a9fd16236a804f4deb5dbec1f6dc99738b7a457d791ff8c4379'

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



