# Maintainer: 0x2501 <0x2501 AT sol740 DOT net>
# Contributor: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.3.6_0
pkgrel=1
pkgdesc='Brother scan-key-tool'
arch=('i686' 'x86_64')
url='http://support.brother.com/'
license=('custom:Brother')
optdepends=('sane: for all default scanning scripts'
            'sendmail: for default "Scan to email" script'
            'gimp: for default "Scan to image" script'
            'cuneiform: for default "Scan to OCR" script')
install=brscan-skey.install

source=('brscan-skey.service' 'brscan-skey-user.service' 'LICENSE.html')
source_i686=("http://download.brother.com/welcome/dlf006649/$pkgname-${pkgver/_/-}.i386.rpm")
source_x86_64=("http://download.brother.com/welcome/dlf006650/$pkgname-${pkgver/_/-}.x86_64.rpm")

b2sums=('834ef59d223b4ce5b34bd7257ced5660b820964869254b82b22dcb7d50a79bf452fd0677de037a013ffd780bfc39f8290e58652e056b67a35eaf524adf25653c'
        '771fdb9cd7a45bf697b6e4ca3faa2299767226ebac1d0e0a6f5a90bd51b374f1f4ea90dc1c9211e166b1c40a2bcce5402ac267bb5f8db8d762e4b6500bd1d3a2'
        '4bbfcab517ff0b2ee48aba4be84fcbe36ef26c4232563fa9fb1915c9c4b76785d38954b51f68792613bf109d3217833176070869ef5be0c312cf4b1db263d91f')
b2sums_i686=('b37ef573f0f134e0e8595908b39be4739d635d1d6a4efb8858ffa0c2dc4dc48b3d92513b68c036145961fef183bbb5a12ea99dbe7a15e490d5534c81e86967da')
b2sums_x86_64=('ab34ef3af6c01155a4019e73eb47916bcb7b25a3577f1c392fa812cc7c022d9cf1d98a8b3c5551c6ece9d19dfd709ad94c4fa079af924edff6028f5576b2e14e')

package() {
    cp -r "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/user
    install -D -m644 "$srcdir"/brscan-skey-user.service "$pkgdir"/usr/lib/systemd/user/brscan-skey.service

    install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
    install -D -m644 "$srcdir"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname

    install -d "$pkgdir"/srv
    install -d -m 775 -o 289 -g 289 "$pkgdir"/srv/brscan-skey
}
