# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.3.2_0
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
b2sums_i686=('ce9303c3f449431a8220a0c0642c9c7d496051dc846ec6c595c9ec746641560c159ea9e8cbaa6985e7b1e941e7112acaabaa5921161b8e018666f29251d0f198')
b2sums_x86_64=('aad0dbf532f571398278cc22b2597fa26f6544e431c567f3e2e1044793659d0142f6a8b9d43fa782be6fda2800af3ae93b4422bac6216371e73568dc8030af87')

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
