# Maintainer: 0x2501 <0x2501 AT sol740 DOT net>
# Contributor: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.3.5_0
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
b2sums_i686=('78055f0bef1d733b1c943470fa3083ecd0a422c88151103b5346da4ba431e192f23195a0cde614d8eb601741f644f5ff0eea973e4b08087ae4e564ab1ba392a9')
b2sums_x86_64=('22498692f345da364d116b026314a7a9d29916102b571604435918fda80dfc624754bd1bd8e50c2d246cb5649ffc7850a3579aa2063cb5c44948d3f505c521df')

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
