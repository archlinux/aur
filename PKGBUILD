# Maintainer: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.2.4_1
pkgrel=10
pkgdesc='Brother scan-key-tool'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('custom:Brother')
optdepends=('sane: for all default scanning scripts'
            'sendmail: for default "Scan to email" script'
            'gimp: for default "Scan to image" script'
            'cuneiform: for default "Scan to OCR" script')
install=brscan-skey.install

source_i686=("http://www.brother.com/pub/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
sha256sums_i686=('30e236f1256d88431eb6fd8f052165ed976b0616e89cdb18196bf894d06c401a')

source_x86_64=("http://www.brother.com/pub/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
sha256sums_x86_64=('2e034b37e282e44a6f94315d932eb8f34693007e4abd10ca10fb4ec468c9bb3d')

source=('brscan-skey.service' 'brscan-skey-user.service' 'LICENSE.html')
sha256sums=('80d1d92f71381c160a93ddac1bfcde1e7922dc84332f1f7561c6d328af7e7219'
            '511e49ac6618f2c11e5ed3a4ce4c235bd5d46faa584974f318447b117759651a'
            '7529071ca3e1a5a1a8558a4d2fc5dd47a4f104f1eb3e9be093de8a2a7c3a216a')

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
