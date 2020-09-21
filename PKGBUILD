# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.3.1_1
pkgrel=1
pkgdesc='Brother scan-key-tool'
arch=('i686' 'x86_64')
url='https://support.brother.com'
license=('custom:Brother')
optdepends=('sane: for all default scanning scripts'
            'sendmail: for default "Scan to email" script'
            'gimp: for default "Scan to image" script'
            'cuneiform: for default "Scan to OCR" script')
install=brscan-skey.install

source_i686=("https://download.brother.com/welcome/dlf006649/brscan-skey-0.3.1-1.i386.rpm")
sha256sums_i686=('6421b1eb56b2f2f0ca9602a877898889ed582a527f5efac094025255ad48e79d')

source_x86_64=("https://download.brother.com/welcome/dlf006650/brscan-skey-0.3.1-1.x86_64.rpm")
sha256sums_x86_64=('0fe2c708eddc51ba6299eaf9a37f1c309d3e398411c61886b291aa402706aa10')

source=('brscan-skey.service' 'brscan-skey-user.service')
sha256sums=('80d1d92f71381c160a93ddac1bfcde1e7922dc84332f1f7561c6d328af7e7219'
            '511e49ac6618f2c11e5ed3a4ce4c235bd5d46faa584974f318447b117759651a')

package() {
    cp -r "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/user
    install -D -m644 "$srcdir"/brscan-skey-user.service "$pkgdir"/usr/lib/systemd/user/brscan-skey.service

    install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
    install -D -m644 "$pkgdir"/opt/brother/scanner/brscan-skey/LICENSE_ENG.txt "$pkgdir"/usr/share/licenses/$pkgname

    install -d "$pkgdir"/srv
    install -d -m 775 -o 289 -g 289 "$pkgdir"/srv/brscan-skey
}
